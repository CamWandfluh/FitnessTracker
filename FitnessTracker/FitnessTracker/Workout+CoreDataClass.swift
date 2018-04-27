//
//  Workout+CoreDataClass.swift
//  FitnessTracker
//
//  Created by Cameron Wandfluh on 4/26/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Workout)
public class Workout: NSManagedObject {
    
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(category: String?, date: Date?, duration: Int16) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Workout.entity(), insertInto: managedContext)
        
        self.category = category
        self.date = date
        self.duration = duration
        
    }

}
