//
//  AlertHelper.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/9/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

struct Alert {
    var alertController: UIAlertController!
    
    init(title: String, message: String, style: UIAlertController.Style) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    /// This function is used to show an alert controller
    /// - Parameters:
    ///   - viewController: The view controller to show the alert
    ///   - completion: A completion to notify that the alert was shown
    func showAlert(_ viewController: UIViewController, completion: @escaping ()->()) {
        let okAction = UIAlertAction(
            title: Constants.Messages.dataFailedActionTitle.rawValue,
            style: .default,
            handler: nil
            )
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: {
            completion()
        })
    }
}
