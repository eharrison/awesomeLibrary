//
//  DesignableImageView.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

@IBDesignable public class DesignableImageView: UIImageView {
    
    @IBInspectable public var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable public var addShaddow: Bool = false {
        didSet {
            if addShaddow {
                layer.shadowPath = UIBezierPath(rect: bounds).CGPath
                layer.shouldRasterize = true
            }
        }
    }
    
}
