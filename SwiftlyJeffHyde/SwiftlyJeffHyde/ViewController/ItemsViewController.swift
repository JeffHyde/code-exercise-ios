//
//  ViewController.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/7/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController, DataBinder {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ItemsViewModel()
    let gradientBackgroundLayer = CAGradientLayer()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let sectionZero = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.dataBinder = self
        viewModel.fetchData(source: Constants.Urls.dataSourceUrl.rawValue, failed: {
            self.viewModel.fetchData(source: Constants.Urls.backupDataSourceUrl.rawValue, failed: {
                DispatchQueue.main.async {
                    let failureAlert = Alert(
                        title: Constants.Messages.dataFailedTitle.rawValue,
                        message: Constants.Messages.dataFailedMessage.rawValue,
                        style: .alert
                    )
                    failureAlert.showAlert(self, completion: {
                        self.activityIndicator.stopAnimating()
                    })
                }
            })
        })
    }

    /// The delegate function for updating each cell after the image completed downloading
    /// - Parameter index: The index of the cell to reload
    func didDownloadImage(atIndex index: Int) {
        DispatchQueue.main.async {
            self.collectionView.reloadItems(
                at: [IndexPath(row: index, section: self.sectionZero)]
            )
        }
    }
    
    /// The delegate function for reloading the collection view and stoping the activity indicator
    /// after the data has completed downloading
    func didUpdateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

//MARK: - ViewController Extension
extension ItemsViewController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradientBackgroundLayer.frame = view.layer.bounds
    }
        
    /// This function does some initial setup for the view controller
    func setupView() {
        overrideUserInterfaceStyle = .light
        
        activityIndicator.frame = CGRect(
            x: view.frame.size.width/Constants.NumberValues.activityIndicatorXPositionDivisor,
            y: view.frame.size.height/Constants.NumberValues.activityIndicatorYPositionDivisor,
            width: Constants.NumberValues.activityIndicatorWidth,
            height: Constants.NumberValues.activityIndicatorHeight
        )
        activityIndicator.color = UIColor(named: Constants.ColorNames.swiftlyColor.rawValue)
        collectionView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        backgroundView.layer.insertSublayer(
            graidentBakgroundColor(for: view, colors: [
                UIColor(
                    named: Constants.ColorNames.lightBackgroundColor.rawValue
                    )?.cgColor ??  UIColor.white.cgColor,
                UIColor(
                    named: Constants.ColorNames.darkBackgroundColor.rawValue
                    )?.cgColor ?? UIColor.gray.cgColor
            ]),
            at:Constants.NumberValues.backgroundViewSublayerIndex
        )
        
        collectionView.register(
            UINib(nibName: Constants.Identifiers.itemsHeaderNibName.rawValue, bundle: nil),
            forCellWithReuseIdentifier: Constants.Identifiers.itemsHeaderCellId.rawValue
        )
    }
    
    /// This function creates a graident color and returns a CAGradientLayer
    /// - Parameter view: The view theat recieves the color
    /// - Parameter colors: The colors to use for the graident
    func graidentBakgroundColor(for view: UIView, colors: [CGColor]) -> CAGradientLayer {
        gradientBackgroundLayer.colors =  colors
        gradientBackgroundLayer.locations = Constants.NumberValues.graidentLocations
        gradientBackgroundLayer.frame = view.bounds
        
        return gradientBackgroundLayer
    }
}

//MARK: - CollectionView DataSource & Delegate
extension ItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.setNumberOfItems()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.itemsCellId.rawValue,
            for: indexPath
            ) as! ItemsCollectionViewCell
        cell.configure(viewModel: viewModel, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.itemsHeaderCellId.rawValue,
            for: Constants.NumberValues.collectionViewHeaderIndex
            ) as! ItemsCollectionViewHeaderCell
        
        return cell
    }
}

//MARK: - CollectionView FlowLayout Delegate
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.NumberValues.cellLineSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.NumberValues.cellInteritemSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return viewModel.setItemSize(
            screenWidth: collectionView.frame.size.width,
            index: indexPath.row
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: Constants.NumberValues.collectionViewHeaderHeight
        )
    }
}
