//
//  UICollectionViewCell+Awesome.swift
//  AwesomeLibrary
//
//  Created by Evandro Harrison Hoffmann on 6/7/16.
//  Copyright © 2016 DogTownMedia. All rights reserved.
//

import Foundation

extension UICollectionViewCell{
    
    public func setImage(url: String?, placeholder: UIImage?, imageViewName: String, collectionView: UICollectionView, indexPath: NSIndexPath, showLoading: Bool, completion:((image: UIImage?) -> Void)?) -> NSURLSessionDataTask?{
        
        if let imageView = self.valueForKey(imageViewName) as? UIImageView {
            return imageView.setImage(url, placeholder: placeholder, showLoading: showLoading) { (image) in
                
                if let updateCell = collectionView.cellForItemAtIndexPath(indexPath) {
                    if let imageView = updateCell.valueForKey(imageViewName) as? UIImageView {
                        imageView.image = image
                    }
                }
                
                completion?(image: image)
            }
        } else {
            completion?(image: nil)
        }
        
        return nil
    }
    
    public func setImage(url: String?, thumbnailUrl: String?, placeholder: UIImage?, imageViewName: String, collectionView: UICollectionView, indexPath: NSIndexPath, showLoading: Bool, completion:((image: UIImage?) -> Void)?) -> NSURLSessionDataTask?{
        
        return self.setImage(thumbnailUrl, placeholder: placeholder, imageViewName: imageViewName, collectionView: collectionView, indexPath: indexPath, showLoading: showLoading) { (thumbnail) in
            self.setImage(url, placeholder: placeholder, imageViewName: imageViewName, collectionView: collectionView, indexPath: indexPath, showLoading: showLoading) { (image) in
                completion?(image: image)
            }
        }
    }
    
}