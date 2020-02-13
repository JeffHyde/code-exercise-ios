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
    func testDataNotNil() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
       
        // Act
        
        // Assert
        XCTAssertNotNil(jsonData)
    }
    
    func testErrorIsNil() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        var decodingError: Error?
        
        // Act
        do {
            let _ = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
        } catch let error {
            decodingError = error
        }
        
        // Assert
        XCTAssertNil(decodingError)
    }
    
    func testItemsNotNil() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertNotNil(items)
    }
    
    func testCanvasUnitISEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch  {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.canvasUnit, 16)
    }
    
    func testManagerSpecialsNotNil() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertNotNil(items?.managerSpecials?[0])
    }
    
    func testDisplayNameIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].display_name, "Noodle Dish with Roasted Black Bean Sauce")
    }
    
    func testHeightIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].height, 8)
    }
    
    func testImageUrlIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].imageUrl, "https://raw.githubusercontent.com/prestoqinc/code-exercise-ios/master/images/L.png")
    }
    
    func testOriginalPriceIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].original_price, "2.00")
    }
    
    func testPriceIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].price, "1.00")
    }
    
    func testWidthIsEqual() {
        // Arrange
        let jsonData = mockJSON.data(using: .utf8)!
        
        // Act
        var items: ItemsModel?
        
        do {
            let decodedData = try JSONDecoder().decode(ItemsModel.self, from: jsonData)
            items = decodedData
        } catch {
            XCTFail()
        }
        
        // Assert
        XCTAssertEqual(items?.managerSpecials?[0].width, 16)
    }
}
