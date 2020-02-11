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
        itemBackgroundView.layer.cornerRadius = Constants.cellCornerRadius
        itemBackgroundView.layer.borderWidth = Constants.cellBorderWidth
        itemBackgroundView.layer.borderColor = Constants.cellBorderColor
        itemBackgroundView.layer.shadowColor = Constants.cellShadowColor
        itemBackgroundView.layer.shadowOpacity = Constants.cellBackgroundShadowOpacity
        itemBackgroundView.layer.shadowRadius = Constants.cellBackgroundShadowRadius
        itemBackgroundView.layer.shadowOffset = Constants.cellBackgroundShadowOffset
        
        itemImageView.image = viewModel.setImage(
            viewModel: viewModel,
            index: indexPath.row
        )
        itemDisplayNameLabel.text = viewModel.setDisplayName(
            viewModel: viewModel,
            index: indexPath.row
        )
        itemOriginalPriceLabel.attributedText = viewModel.setOriginalPrice(
            viewModel: viewModel,
            index: indexPath.row
        )
        itemPriceLabel.text = viewModel.setPrice(viewModel: viewModel, index: indexPath.row)
    }
}
