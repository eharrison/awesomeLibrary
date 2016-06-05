//
//  UIView+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

public extension UIView {
    
    public func animateTouchDown(completion:() -> Void){
        UIView.animateWithDuration(0.05, animations: {
            self.alpha = 0.9
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
        }) { (Bool) in
            UIView .animateWithDuration(0.1, animations: {
                self.alpha = 1
                self.transform = CGAffineTransformMakeScale(1, 1)
            }) { (Bool) in
                completion()
            }
        }
    }
    
}