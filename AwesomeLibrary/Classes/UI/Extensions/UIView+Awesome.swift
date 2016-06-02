//
//  UIView+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension UIView{
    
    func addShadow(){
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 10
        
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
        //self.layer.shouldRasterize = true
    }
    
}