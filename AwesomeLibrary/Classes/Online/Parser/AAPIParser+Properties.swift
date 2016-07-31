//
//  AAPIParser+Properties.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/15/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension AAPIParser {
    
    public static func propertyNames(object: AnyObject) -> [String] {
        return Mirror(reflecting: object).children.filter { $0.label != nil }.map { $0.label! }
    }
    
}