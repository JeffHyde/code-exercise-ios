//
//  SwiftlyJeffHydeTests.swift
//  SwiftlyJeffHydeTests
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import XCTest
@testable import SwiftlyJeffHyde

class SwiftlyJeffHydeTests: XCTestCase {

    let mockJSON = """
{
  "canvasUnit": 16,
  "managerSpecials": [
    {
      "display_name": "Noodle Dish with Roasted Black Bean Sauce",
      "height": 8,
      "imageUrl": "https://raw.githubusercontent.com/prestoqinc/code-exercise-ios/master/images/L.png",
      "original_price": "2.00",
      "price": "1.00",
      "width": 16
    }
  ]
}
"""

}

extension SwiftlyJeffHydeTests {
    func testViewModel() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        var decodingError: Error?
        let specials = SpecialsModel(
            display_name: "Noodle Dish with Roasted Black Bean Sauce",
            original_price: "2.00",
            price: "1.00",
            imageUrl: "https://raw.githubusercontent.com/prestoqinc/code-exercise-ios" +
            "/master/images/L.png",
            width: 16,
            height: 8
        )
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch let error {
            decodingError = error
        }
        
        // Assert
        XCTAssertNotNil(jsonData)
        XCTAssertNotNil(items)
        XCTAssertNil(decodingError)
        XCTAssertEqual(items?.canvasUnit, 16)
        XCTAssertNotNil(items?.managerSpecials?[0])
        XCTAssertEqual(items?.managerSpecials?[0], specials)
    }
}
