//
//  AAPIParser+Instagram.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension AAPIParser{
    
    // MARK: - AccessToken
    
//    static func instagramAccessToken(ur: String) -> String{
//        https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code
//    }
    
    // MARK: - Instagram User
    
    public static func instagramUser(data: NSData) -> InstagramUserObject?{
        if let jsonObject = jsonObject(data) {
            if let dataJson = jsonObject["data"] {
            
                let instagramUserObject = InstagramUserObject()
                instagramUserObject.userID = stringValue(dataJson!, key:"id")
                instagramUserObject.username = stringValue(dataJson!, key:"username")
                instagramUserObject.bio = stringValue(dataJson!, key:"bio")
                instagramUserObject.fullname = stringValue(dataJson!, key:"full_name")
                instagramUserObject.website = stringValue(dataJson!, key:"website")
                instagramUserObject.profilePicture = stringValue(dataJson!, key:"profile_picture")

                return instagramUserObject
            }
            return nil
        }
        return nil
    }
    
    // MARK: - Instagram Pictures
    
    public static func instagramPictures(data: NSData) -> [InstagramObject]{
        var pictures = [InstagramObject]()
        
        if let jsonObject = jsonObject(data) {
            if let dataJson = jsonObject["data"] as? [AnyObject] {
                for pictureData in dataJson {
                    pictures.append(instagramObject(pictureData))
                }
            }
        }
        
        return pictures
    }
    
    public static func instagramObject(jsonObject: AnyObject) -> InstagramObject {
        let instagramObject = InstagramObject()
        instagramObject.objectID = stringValue(jsonObject, key: "id")
        
        if let imagesJson = jsonObject["images"] as? [String: AnyObject]{
            if let imageJson = imagesJson["low_resolution"] as? [String: AnyObject]{
                instagramObject.imageLowQuality = stringValue(imageJson, key: "url")
            }
            if let imageJson = imagesJson["thumbnail"] as? [String: AnyObject]{
                instagramObject.imageThumbnail = stringValue(imageJson, key: "url")
            }
            if let imageJson = imagesJson["standard_resolution"] as? [String: AnyObject]{
                instagramObject.imageStandard = stringValue(imageJson, key: "url")
            }
        }
        
        return instagramObject
    }
}