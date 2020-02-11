//
//  DataBinder.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/9/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import Foundation

/// The delegates used to update the view
protocol DataBinder {
    func didDownloadImage(atIndex index: Int)
    func didUpdateData()
}
