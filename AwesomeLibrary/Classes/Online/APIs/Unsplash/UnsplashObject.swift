//
//  UnsplashObject.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/11/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import UIKit

public class UnsplashObject: NSObject {
    
    public var format: String?
    public var filename: String?
    public var author: String?
    public var authorUrl: String?
    public var postUrl: String?
    public var width = 0
    public var height = 0
    public var objectID = 0
    
    public func fileObject() -> FileObject{
        let file = FileObject()
        file.imageUrl = String(format:"https://unsplash.it/%d/%d?image=%d", width, height, objectID)
        file.thumbnailUrl = String(format:"https://unsplash.it/%d/%d?image=%d", Double(width)*0.2, Double(height)*0.2, objectID)
        file.title = author
        
        return file
    }
    
}
