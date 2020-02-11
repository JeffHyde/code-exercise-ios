//
//  ClientHelper.swift
//  SwiftlyJeffHyde
//
//  Created by Jeff  Hyde on 2/9/20.
//  Copyright © 2020 Jeff  Hyde. All rights reserved.
//

import UIKit

struct Client {
    /// This function fetches data from the givin endpoint
    /// - Parameters:
    ///   - urlString: The endpoint url
    ///   - isImage: A Boolean used to determine is an image is being downloaded
    ///   - completion: A closure to notify of completion
    func fetchData(
        source urlString: String,
        isImage: Bool,
        completion: @escaping (ItemsModel?, UIImage?) -> ()
    ) {
        guard let url = URL(string: urlString) else { completion(nil, nil); return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("fetchData Session Error: \(error), Is Image: \(isImage)")
                completion(nil, nil)
            } else {
                if let response = response as? HTTPURLResponse {
                    guard response.statusCode == 200 else {
                        print("fetchData Status Code: \(response.statusCode), Is Image: \(isImage)")
                        completion(nil, nil)
                        return
                    }
                    guard let data = data else {
                        print("fetchData Data is nil, Is Image: \(isImage)")
                        completion(nil, nil);
                        return
                    }
                    
                    if !isImage {
                        do {
                            let json = try JSONDecoder().decode(ItemsModel.self, from: data)
                            completion(json, nil)
                        } catch let error {
                            print("fetchData JSON Decoding Error: ", error)
                            completion(nil, nil)
                        }
                    } else {
                        guard let image = UIImage(data: data) else {
                            print("fetchData Image is not data, Is Image: \(isImage)")
                            completion(nil, nil);
                            return
                        }
                        completion(nil, image)
                    }
                    
                } else {
                    print("fetchItems Response Not HTTP, Is Image: \(isImage)")
                    completion(nil, nil)
                }
            }
        }
        dataTask.resume()
    }
}
