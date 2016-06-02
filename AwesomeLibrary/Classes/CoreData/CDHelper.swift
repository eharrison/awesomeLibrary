//
//  CDHelper.swift
//  LanguageQuiz
//
//  Created by Evandro H Hoffmann on 9/3/15.
//  Copyright (c) 2015 It's Day Off. All rights reserved.
//

import UIKit
import CoreData

public class CDHelper: NSObject {
    
    public static func save(){
        let managedContext = DataAccess.sharedInstance.managedObjectContext
        
        do {
            try managedContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            NSLog("Could not save \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    public static func create(entityName: String) -> NSManagedObject{
        let managedContext = DataAccess.sharedInstance.managedObjectContext
        let entity =  NSEntityDescription.entityForName(entityName, inManagedObjectContext:managedContext)
        return NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
    }
    
    public static func remove(object: NSManagedObject){
        let managedContext = DataAccess.sharedInstance.managedObjectContext
        managedContext.deleteObject(object)
    }
    
    public static func list(entityName:String, sort:String, ascending:Bool) -> NSArray{
        let managedContext = DataAccess.sharedInstance.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:entityName)
        
        let sortDescriptor = NSSortDescriptor(key:sort, ascending:ascending)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var fetchedResults: NSArray!
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if let results: NSArray = fetchedResults {
                return results
            }
        }catch{
            let nserror = error as NSError
            print("Could not fetch \(nserror), \(nserror.userInfo)")
        }
        
        return fetchedResults
    }
    
    public static func list(entityName:String) -> NSArray{
        let managedContext = DataAccess.sharedInstance.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:entityName)
        
        var fetchedResults: NSArray!
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if let results: NSArray = fetchedResults {
                return results
            }
        }catch{
            let nserror = error as NSError
            print("Could not fetch \(nserror), \(nserror.userInfo)")
        }
        
        return fetchedResults
    }
    
    public static func sortArray(array:NSArray, sort:String, ascending:Bool) -> NSArray{
        let sortDescriptor = NSSortDescriptor(key:sort, ascending:ascending)
        let sortDescriptors = [sortDescriptor]
        return array.sortedArrayUsingDescriptors(sortDescriptors)
    }
}
