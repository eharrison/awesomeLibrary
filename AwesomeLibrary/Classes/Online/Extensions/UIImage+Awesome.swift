//
//  UIImage+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension UIImage{
    
    public static func loadImage(url: String, completion:(image: UIImage?) -> Void) -> NSURLSessionDataTask?{
        let task = AAPIFetcher.fetchData(url) { (data) in
            if let data = data {
                completion(image: UIImage(data: data))
            }else{
                completion(image: nil)
            }
        }
        
        return task
    }
    
}