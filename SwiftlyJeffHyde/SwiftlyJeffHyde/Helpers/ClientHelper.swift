//
//  ClientHelper.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/9/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

struct Client {
    /// This function fetches data from the given url
    /// - Parameters:
    ///   - urlString: The url string used to fetch data
    ///   - completion: A closure to notify of completion
    func fetchData(source urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("fetchData Session Error: \(error)")
                completion(nil)
                return
            } else {
                if let response = response as? HTTPURLResponse {
                    guard 200 ... 299 ~= response.statusCode else {
                        print("fetchData Status Code: \(response.statusCode)")
                        completion(nil)
                        return
                    }
                    guard let data = data else {
                        print("fetchData Data is nil")
                        completion(nil)
                        return
                    }
                    completion(data)
                } else {
                    print("fetchItems Response Not HTTP")
                    completion(nil)
                    return
                }
            }
        }
        dataTask.resume()
    }
}
