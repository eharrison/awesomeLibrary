//
//  UIButton+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/7/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension UIButton{
    
    public func setImage(url: String?, placeholder: UIImage?, state: UIControlState, showLoading: Bool, completion:((image: UIImage?) -> Void)?) -> NSURLSessionDataTask?{
        self.layer.masksToBounds = true
        
        if let placeholder = placeholder {
            self.setImage(placeholder, forState: state)
        }
        
        if showLoading {
            self.animateDisable {}
        }
        
        return UIImage.loadImage(url) { (image) in
            if showLoading {
                self.animateEnable {}
            }
            
            self.setImage(image, forState: state)
            completion?(image: image)
        }
    }
    
    public func setImage(url: String?, thumbnailUrl: String?, placeholder: UIImage?, state: UIControlState, showLoading: Bool, completion:((image: UIImage?) -> Void)?) -> NSURLSessionDataTask?{
        
        return setImage(thumbnailUrl, placeholder: placeholder, state: state, showLoading: showLoading) { (thumbnail) in
            self.setImage(url, placeholder: placeholder, state: state, showLoading: false) { (image) in
                completion?(image: image)
            }
        }
    }
    
}