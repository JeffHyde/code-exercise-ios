//
//  ItemsViewModel.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

class ItemsViewModel {
    private let client = Client()
    var items: ItemsModel?
    var dataBinder: DataBinder!
}

extension ItemsViewModel {
    /// This function fetchs the json data, an array of images and updates the view
    /// - Parameters:
    ///   - urlString: The endpoint url
    ///   - failed: A closure to notify of an endpoint failure
    func fetchData(source urlString: String, failed: @escaping ()->()) {
        client.fetchData(source: urlString, isImage: false) { (items, image) in
            guard let items = items else { failed(); return }
            self.items = items
            guard let managerSpecials = items.managerSpecials else { failed(); return }
            for (index, item) in managerSpecials.enumerated() {
                guard let imageUrl = item.imageUrl else { return }
                
                self.client.fetchData(source: imageUrl, isImage: true) { (items, image) in
                    item.image = image ?? UIImage(named: "J")
                    
                    /// Update each collection view cell after the image was downloaded
                    self.dataBinder.didDownloadImage(atIndex: index)
                }
            }
            
            /// Update the collection view after all data has completed downloading
            self.dataBinder.didUpdateData()
        }
    }
    
    /// This function gets the image from the view model and returns a UIImage
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setImage(viewModel: ItemsViewModel, index: Int) -> UIImage {
        return viewModel.items?.managerSpecials?[index].image ?? UIImage(named: "J")!
    }
    
    /// This function gets the display name from the view model and returns a String
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setDisplayName(viewModel: ItemsViewModel, index: Int) -> String {
        return viewModel.items?.managerSpecials?[index].display_name ?? ""
    }
    
    /// This function gets the items original price from the view model and
    /// returns a NSMutableAttributedString
    /// - Parameters:
    ///   - viewModel: The pased in view model
    ///   - index: The passed in index
    func setOriginalPrice(viewModel: ItemsViewModel, index: Int) -> NSMutableAttributedString {
        let originalPriceAttributeString: NSMutableAttributedString =  NSMutableAttributedString(
                   string: "$" + (viewModel.items?.managerSpecials?[index].original_price ?? "")
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
    func setPrice(viewModel: ItemsViewModel, index: Int) -> String {
        return "$" + (viewModel.items?.managerSpecials?[index].price ?? "")
    }
    
    /// This function sets the item size based on canvas units
    /// - Parameters:
    ///   - viewModel: The passed in view model
    ///   - screenWidth: The width of the passed in view
    ///   - index: The passed in index
    func setItemSize(viewModel: ItemsViewModel, screenWidth: CGFloat, index: Int) -> CGSize {
        let canvasUnit = CGFloat(viewModel.items?.canvasUnit ?? 0)
        let itemWidth = CGFloat(viewModel.items?.managerSpecials?[index].width ?? 0)
        let itemHeight = CGFloat(viewModel.items?.managerSpecials?[index].height ?? 0)
        return CGSize(
            width: screenWidth / canvasUnit * itemWidth,
            height: screenWidth / canvasUnit * itemHeight
        )
    }
    
    /// This function returns the number of items in the managers specials array
    /// - Parameter viewModel: The passed in view model
    func setNumberOfItems(viewModel: ItemsViewModel) -> Int {
       return viewModel.items?.managerSpecials?.count ?? 0
    }
}
