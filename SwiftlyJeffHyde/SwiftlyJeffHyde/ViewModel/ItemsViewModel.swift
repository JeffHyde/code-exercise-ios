//
//  ItemsViewModel.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit
import os.log

class ItemsViewModel {
    private let client = Client()
    var items: ItemsModel?
    var dataBinder: DataBinder?
}

extension ItemsViewModel {
    /// This function fetchs the json data, an array of images and updates the view
    /// - Parameters:
    ///   - urlString: The endpoint url
    ///   - failed: A closure to notify of an endpoint failure
    func fetchData(source urlString: String, failed: @escaping ()->()) {
        client.fetchData(source: urlString) { (data) in
            guard let data = data else { failed(); return }
            do {
                let jsonData = try JSONDecoder().decode(ItemsModel.self, from: data)
                self.items = jsonData
            } catch {
                os_log("fetchData JSON Decoding Error:", log: .default, type: .error, 0)
                failed()
            }
            
            guard let managerSpecials = self.items?.managerSpecials else {
                failed();
                return
            }
            for (index, item) in managerSpecials.enumerated() {
                guard let imageUrl = item.imageUrl else { return }
                self.client.fetchData(source: imageUrl) { (data) in
                    guard let imageData = data else { failed(); return }
                    item.image = UIImage(data: imageData) ?? self.defaultImage(with: imageUrl)
                    
                    /// Update each collection view cell after the image was downloaded
                    guard let dataBinder = self.dataBinder else { return }
                    dataBinder.didDownloadImage(atIndex: index)
                }
            }
            
            /// Update the collection view after all data has completed downloading
            guard let dataBinder = self.dataBinder else { return }
            dataBinder.didUpdateData()
        }
        
    }
    
    /// This function returns a default UIImage
    /// - Parameter imageUrl: The url to check for the image string
    func defaultImage(with imageUrl: String) -> UIImage {
        switch imageUrl {
        case let j where j.contains(Constants.UrlImageContent.j.rawValue):
            return UIImage(named: Constants.ImageNames.imageJ.rawValue) ?? UIImage()
        case let k where k.contains(Constants.UrlImageContent.j.rawValue):
            return UIImage(named: Constants.ImageNames.imageK.rawValue) ?? UIImage()
        case let l where l.contains(Constants.UrlImageContent.l.rawValue):
            return UIImage(named: Constants.ImageNames.imageL.rawValue) ?? UIImage()
        default:
            return UIImage(named: Constants.ImageNames.imageJ.rawValue) ?? UIImage()
        }
    }
    
    /// This function gets the image from the view model and returns a UIImage
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setImage(index: Int) -> UIImage {
        let specials = items?.managerSpecials?[index]
        let imageUrl = specials?.imageUrl ?? ""
        
        return specials?.image ?? defaultImage(with: imageUrl)
    }
    
    /// This function gets the display name from the view model and returns a String
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setDisplayName(index: Int) -> String {
        return items?.managerSpecials?[index].display_name ?? ""
    }
    
    /// This function gets the items original price from the view model and
    /// returns a NSMutableAttributedString
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setOriginalPrice(index: Int) -> NSMutableAttributedString {
        let originalPriceAttributeString: NSMutableAttributedString =  NSMutableAttributedString(
            string: "$" + (items?.managerSpecials?[index].original_price ?? "")
        )
        
        originalPriceAttributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 2,
            range: NSMakeRange(0, originalPriceAttributeString.length)
        )
        
        return originalPriceAttributeString
    }
    
    /// This function gets the items price from the view model and returns a String
    /// - Parameters:
    ///   - viewModel: The passed in view model
    ///   - index: The passed in index
    func setPrice(index: Int) -> String {
        return "$" + (items?.managerSpecials?[index].price ?? "")
    }
    
    /// This function sets the item size based on canvas units
    /// - Parameters:
    ///   - viewModel: The passed in view model
    ///   - screenWidth: The width of the passed in view
    ///   - index: The passed in index
    func setItemSize(screenWidth: CGFloat, index: Int) -> CGSize {
        let canvasUnit = CGFloat(items?.canvasUnit ?? 0)
        let itemWidth = CGFloat(items?.managerSpecials?[index].width ?? 0)
        let itemHeight = CGFloat(items?.managerSpecials?[index].height ?? 0)
        
        return CGSize(
            width: screenWidth / canvasUnit * itemWidth,
            height: screenWidth / canvasUnit * itemHeight
        )
    }
    
    /// This function returns the number of items in the managers specials array
    /// - Parameter viewModel: The passed in view model
    func setNumberOfItems() -> Int {
        return items?.managerSpecials?.count ?? 0
    }
}
