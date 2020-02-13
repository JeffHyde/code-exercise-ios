//
//  Constants.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/8/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

struct Constants {
    static let itemsCellId = "ItemsCellID"
    static let itemsHeaderId = "ItemsHeaderCellID"
    static let itemsHeaderNibName = "ItemsCollectionViewHeaderCell"
    static let dataSourceUrl = "https://prestoq.com/ios-coding-challenge"
    static let backupDataSourceUrl = "https://raw.githubusercontent.com/" +
    "Swiftly-Systems/code-exercise-ios/master/backup"
    static let managerSpecialsTitle: String = "Manager's Special"
    static let dataFailedTitle = "Error!"
    static let dataFailedMessage = "Somthing went wrong..."
    static let dataFailedActionTitle = "OK"
    static let cellCornerRadius: CGFloat = 8.0
    static let cellBorderWidth: CGFloat = 1.0
    static let cellBorderColor: CGColor = UIColor(
        named: "CellBorderColor"
        )?.cgColor ?? UIColor.gray.cgColor
    static let lightBackgroundColor: CGColor = UIColor(
        named: "LightBackgroundColor"
        )?.cgColor ?? UIColor.white.cgColor
    static let darkBackgroundColor: CGColor = UIColor(
        named: "DarkBackgroundColor"
        )?.cgColor ?? UIColor.gray.cgColor
    static let priceColor: UIColor = UIColor(named: "PriceColor") ?? .green
    static let cellShadowColor = UIColor(
        named: "CellShadowColor"
        )?.cgColor ?? UIColor.black.cgColor
    static let swiftlyColor = UIColor(named: "SwiftlyColor") ?? UIColor.purple
    static let imageJ = UIImage(named: "JImage")
    static let imageK = UIImage(named: "KImage")
    static let imageL = UIImage(named: "LImage")
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
