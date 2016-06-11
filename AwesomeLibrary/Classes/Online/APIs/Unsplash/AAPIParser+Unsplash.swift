//
//  AAPIParser+Unsplash.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/11/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension AAPIParser {
    
    // MARK: - Unsplash Pictures
    
    public static func unsplashPictures(data: NSData) -> [UnsplashObject]{
        var pictures = [UnsplashObject]()
        
        if let jsonObject = jsonObject(data) {
            if let dataJson = jsonObject as? [AnyObject] {
                for pictureData in dataJson {
                    pictures.append(unsplashObject(pictureData))
                }
            }
        }
        
        return pictures
    }
    
    public static func unsplashObject(jsonObject: AnyObject) -> UnsplashObject {
        let unsplashObject = UnsplashObject()
        unsplashObject.objectID = intValue(jsonObject, key: "id")
        unsplashObject.width = intValue(jsonObject, key: "width")
        unsplashObject.height = intValue(jsonObject, key: "height")
        unsplashObject.format = stringValue(jsonObject, key: "format")
        unsplashObject.filename = stringValue(jsonObject, key: "filename")
        unsplashObject.author = stringValue(jsonObject, key: "author")
        unsplashObject.authorUrl = stringValue(jsonObject, key: "author_url")
        unsplashObject.postUrl = stringValue(jsonObject, key: "post_url")
        
        return unsplashObject
    }
}