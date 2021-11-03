//
//  Skills+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/15/21.
//
//

import Foundation
import CoreData


extension Skills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Skills> {
        return NSFetchRequest<Skills>(entityName: "Skills")
    }

    @NSManaged public var skill: String?

}

extension Skills : Identifiable {

}
