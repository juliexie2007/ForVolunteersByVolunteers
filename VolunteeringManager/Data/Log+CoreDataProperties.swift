//
//  Log+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/19/21.
//
//

import Foundation
import CoreData


extension Log {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }

    @NSManaged public var activity: String?
    @NSManaged public var dateTime: Date?
    @NSManaged public var opp_act: Favorites?

}

extension Log : Identifiable {

}
