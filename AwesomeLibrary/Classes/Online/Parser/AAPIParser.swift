//
//  AAPIParser.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import UIKit

public class AAPIParser: NSObject {

    public static func jsonObject(data: NSData) -> AnyObject?{
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            return json
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        return nil
    }
    
    public static func doubleValue(jsonObject: AnyObject, key: String) -> Double{
        if let value = jsonObject[key] as? String {
            return Double(value)!
        }else if let array = jsonObject[key] as? [String] {
            return Double(array[0])!
        }
        return 0
    }
    
    public static func intValue(jsonObject: AnyObject, key: String) -> Int{
        if let value = jsonObject[key] as? String {
            return Int(value)!
        }else if let array = jsonObject[key] as? [String] {
            return Int(array[0])!
        }
        return 0
    }
    
    public static func stringValue(jsonObject: AnyObject, key: String) -> String{
        if let value = jsonObject[key] as? String {
            return value
        }else if let array = jsonObject[key] as? [String] {
            return array[0]
        }
        return ""
    }
    
}
