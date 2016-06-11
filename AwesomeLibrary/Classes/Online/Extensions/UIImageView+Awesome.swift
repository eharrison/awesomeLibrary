//
//  UIImageView+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/7/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension UIImageView{
    
    public func setImage(url: String, placeholder: UIImage?, showLoading: Bool, completion:(image: UIImage?) -> Void) -> NSURLSessionDataTask?{
        self.layer.masksToBounds = true
        
        if let placeholder = placeholder {
            self.image = placeholder
        }
        
        if showLoading {
            self.animateDisable {}
        }
        
        return UIImage.loadImage(url) { (image) in
            if showLoading {
                self.animateEnable {}
            }
            
            self.image = image
            completion(image: image)
        }
    }
    
    public func setImage(url: String, thumbnailUrl: String, placeholder: UIImage?, showLoading: Bool, completion:(image: UIImage?) -> Void) -> NSURLSessionDataTask?{
        
        return setImage(thumbnailUrl, placeholder: placeholder, showLoading: showLoading) { (thumbnail) in
            self.setImage(url, placeholder: placeholder, showLoading: false) { (image) in
                completion(image: image)
            }
        }
    }
    
}