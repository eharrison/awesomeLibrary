//
//  AAPIFetcher.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/2/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import UIKit

public class AAPIFetcher: NSObject {

    public static func fetchData(urlString: String?, timeOut: Double, completion:(success: Bool, data: NSData?) -> Void){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var canTimeOut = true
            var timedOut = false
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(timeOut * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                if (canTimeOut) {
                    timedOut = true
                    completion(success:false, data:nil)
                }
            })
            
            fetchData(urlString, completion: { (data) in
                canTimeOut = false;
                
                dispatch_async(dispatch_get_main_queue(), {
                    if let data = data{
                        if !timedOut {
                            completion(success:true, data:data)
                        }
                    }else{
                        if(!timedOut){
                            completion(success:false, data:nil)
                        }
                    }
                })
            })
        }
    }
    
    public static func fetchData(urlString: String?, completion:(data: NSData?) -> Void) -> NSURLSessionDataTask?{
        if let urlString = urlString{
            let urlRequest = NSMutableURLRequest(URL: NSURL(string: urlString)!)
            urlRequest.cachePolicy = .ReturnCacheDataElseLoad
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest, completionHandler: { (data, response, error) in
                dispatch_async(dispatch_get_main_queue(), { 
                    if let error = error{
                        print("There was an error \(error)")
                        completion(data: nil)
                    }else{
                        completion(data: data)
                    }
                })
            })
            task.resume()
            
            return task
        }else{
            completion(data: nil)
        }
        
        return nil
    }
    
}
