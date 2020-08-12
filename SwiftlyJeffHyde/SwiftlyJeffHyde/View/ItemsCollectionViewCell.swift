//
//  ItemsCollectionViewCell.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemBackgroundView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDisplayNameLabel: UILabel!
    @IBOutlet weak var itemOriginalPriceLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
        
    /// This function sets the data on each cell
    /// - Parameters:
    ///   - viewModel: The view model used to set the data
    ///   - indexPath: The index path for the cell
    func configure(viewModel: ItemsViewModel, indexPath: IndexPath) {
        itemBackgroundView.layer.cornerRadius = Constants.NumberValues.cellCornerRadius
        itemBackgroundView.layer.borderWidth = Constants.NumberValues.cellBorderWidth
        itemBackgroundView.layer.borderColor = UIColor(named: Constants.ColorNames.cellBorderColor.rawValue)?.cgColor
        itemBackgroundView.layer.shadowColor = UIColor(named: Constants.ColorNames.cellShadowColor.rawValue)?.cgColor
        itemBackgroundView.layer.shadowOpacity = Constants.NumberValues.cellBackgroundShadowOpacity
        itemBackgroundView.layer.shadowRadius = Constants.NumberValues.cellBackgroundShadowRadius
        itemBackgroundView.layer.shadowOffset = Constants.NumberValues.cellBackgroundShadowOffset
        
        itemImageView.image = viewModel.setImage(index: indexPath.row)
        itemDisplayNameLabel.text = viewModel.setDisplayName(index: indexPath.row)
        itemOriginalPriceLabel.attributedText = viewModel.setOriginalPrice(index: indexPath.row)
        itemPriceLabel.text = viewModel.setPrice(index: indexPath.row)
    }
}
