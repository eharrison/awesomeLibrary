//
//  FileObject.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/11/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import UIKit

public class FileObject: NSObject {

    public var imageUrl: String?
    public var thumbnailUrl: String?
    public var title: String?
    public var width: Int?
    public var height: Int?
    
    public func isPortrait() -> Bool {
        return width < height
    }
    
    public func isLandscape() -> Bool {
        return width > height
    }
    
    public func isSquare() -> Bool {
        return width == height
    }
    
}
