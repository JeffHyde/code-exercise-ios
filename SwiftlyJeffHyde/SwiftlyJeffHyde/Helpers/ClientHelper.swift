//
//  ClientHelper.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/9/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit
import os.log

struct Client {
    /// This function fetches data from the given url
    /// - Parameters:
    ///   - urlString: The url string used to fetch data
    ///   - completion: A closure to notify of completion
    func fetchData(source urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                os_log("fetchData Session Error:", log: .default, type: .error, 0)
                completion(nil)
                return
            } else {
                if let response = response as? HTTPURLResponse {
                    guard 200 ... 299 ~= response.statusCode else {
                        os_log("fetchData Status Code:", log: .default, type: .error, 0)
                        completion(nil)
                        return
                    }
                    guard let data = data else {
                        os_log("fetchData Date is nil:", log: .default, type: .error, 0)
                        completion(nil)
                        return
                    }
                    os_log("fetchData OS_LOG", log: .disabled, type: .default, 0)
                    completion(data)
                } else {
                    os_log("fetchData Response Not HTTP:", log: .default, type: .error, 0)
                    completion(nil)
                    return
                }
            }
        }
        dataTask.resume()
    }
}
