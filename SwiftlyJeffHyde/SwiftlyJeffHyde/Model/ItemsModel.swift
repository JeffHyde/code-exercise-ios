//
//  ItemsModel.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

/// The object model for grocery items
class ItemsModel: Decodable {    
    var canvasUnit: Int?
    var managerSpecials: [SpecialsModel]?
}

/// The object model for manager specials array
class SpecialsModel: Decodable, Equatable {
    var display_name: String?
    var original_price: String?
    var price: String?
    var imageUrl: String?
    var image: UIImage?
    var width: Int?
    var height: Int?
    
    init(
        display_name: String,
        original_price: String,
        price: String,
        imageUrl: String,
        width: Int,
        height: Int
    ) {
        self.display_name = display_name
        self.original_price = original_price
        self.price = price
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
    }
    
    /// The keys that will be decoded
    private enum CodingKeys: Any, CodingKey {
        case display_name,
        original_price,
        price,
        imageUrl,
        width,
        height
    }
    
    /// The required initializer for coding keys
    /// - Parameter decoder: The decoder used to format values
    required init(from decoder:  Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            display_name = try container.decode(String?.self, forKey: .display_name)
            original_price = try container.decode(String.self, forKey: .original_price)
            price = try container.decode(String.self, forKey: .price)
            imageUrl = try container.decode(String.self, forKey: .imageUrl)
            width = try container.decode(Int.self, forKey: .width)
            height = try container.decode(Int.self, forKey: .height)
        } catch let error {
            print("Coding Failed: ", error)
        }
    }
    
    /// Equatable conformance
    /// - Parameters:
    ///   - lhs: The left hand side object for checking equality
    ///   - rhs: The right hand side object for checking equality
    static func == (lhs: SpecialsModel, rhs: SpecialsModel) -> Bool {
        return lhs.display_name == rhs.display_name &&
            lhs.original_price == rhs.original_price &&
            lhs.price == rhs.price &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.width == rhs.width &&
            lhs.height == rhs.height
    }
}
