//
//  DesignableView.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/3/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

@IBDesignable public class DesignableView: UIView {

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

}
