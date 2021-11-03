//
//  Causes+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/15/21.
//
//

import Foundation
import CoreData


extension Causes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Causes> {
        return NSFetchRequest<Causes>(entityName: "Causes")
    }

    @NSManaged public var cause: String?

}

extension Causes : Identifiable {

}
