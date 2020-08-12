//
//  CollectionViewHeaderCell.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/8/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

class ItemsCollectionViewHeaderCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = Constants.Messages.managerSpecialsTitle.rawValue
    }
}
