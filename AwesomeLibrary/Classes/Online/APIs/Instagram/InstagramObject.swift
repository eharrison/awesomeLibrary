//
//  InstagramObject.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

public class InstagramObject: NSObject {

    public var imageLowQuality: String?
    public var imageThumbnail: String?
    public var imageStandard: String?
    public var objectID: String?
    
    public func fileObject() -> FileObject{
        let file = FileObject()
        file.imageUrl = imageStandard
        
        return file
    }
    
}
