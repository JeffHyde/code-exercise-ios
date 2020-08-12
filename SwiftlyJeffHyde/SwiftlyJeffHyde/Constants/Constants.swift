//
//  Constants.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/8/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

struct Constants {
    
    enum ImageNames: String {
        case imageJ = "JImage"
        case imageK = "KImage"
        case imageL = "LImage"
    }
    
    enum UrlImageContent: String {
        case j = "J.png"
        case k = "K.png"
        case l = "L.png"
    }
    
    enum ColorNames: String {
        case cellBorderColor = "CellBorderColor"
        case lightBackgroundColor = "LightBackgroundColor"
        case darkBackgroundColor = "DarkBackgroundColor"
        case priceColor = "PriceColor"
        case cellShadowColor = "CellShadowColor"
        case swiftlyColor = "SwiftlyColor"
    }
    
    enum Identifiers: String {
        case itemsCellId = "ItemsCellID"
        case itemsHeaderCellId = "ItemsHeaderCellID"
        case itemsHeaderNibName = "ItemsCollectionViewHeaderCell"
    }
    
    enum Urls: String {
        case dataSourceUrl = "https://prestoq.com/ios-coding-challenge"
        case backupDataSourceUrl = "https://raw.githubusercontent.com/Swiftly-Systems/code-exercise-ios/master/backup"
    }
    
    enum Messages: String {
        case managerSpecialsTitle = "Manager's Special"
        case dataFailedTitle = "Error!"
        case dataFailedMessage = "Somthing went wrong..."
        case dataFailedActionTitle = "OK"
    }
    
    struct NumberValues {
        static let cellCornerRadius: CGFloat = 8.0
        static let cellBorderWidth: CGFloat = 1.0
        static let graidentLocations: [NSNumber] = [0.0, 0.75]
        static let cellBackgroundShadowOpacity: Float = 0.1
        static let cellBackgroundShadowRadius: CGFloat = 2.0
        static let cellBackgroundShadowOffset = CGSize(width: 0, height: 4)
        static let activityIndicatorXPositionDivisor: CGFloat = 2.0
        static let activityIndicatorYPositionDivisor: CGFloat = 2.0
        static let activityIndicatorWidth: CGFloat = 0.0
        static let activityIndicatorHeight: CGFloat = 0.0
        static let backgroundViewSublayerIndex: UInt32 = 0
        static let cellLineSpacing: CGFloat = 0.0
        static let cellInteritemSpacing: CGFloat = 0.0
        static let collectionViewHeaderIndex = IndexPath(row: 0, section: 0)
        static let collectionViewHeaderHeight: CGFloat = 55.0
    }
}
