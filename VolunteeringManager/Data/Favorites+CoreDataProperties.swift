//
//  Favorites+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/19/21.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var connected: Bool
    @NSManaged public var favorated: Bool
    @NSManaged public var opp_contact_email: String?
    @NSManaged public var opp_description: String?
    @NSManaged public var opp_state: String?
    @NSManaged public var opp_time_zone: String?
    @NSManaged public var opp_title: String?
    @NSManaged public var opp_virtual: Bool
    @NSManaged public var opp_zip_code: String?
    @NSManaged public var org_name: String?
    @NSManaged public var opp_act: NSOrderedSet?

}

// MARK: Generated accessors for opp_act
extension Favorites {

    @objc(insertObject:inOpp_actAtIndex:)
    @NSManaged public func insertIntoOpp_act(_ value: Log, at idx: Int)

    @objc(removeObjectFromOpp_actAtIndex:)
    @NSManaged public func removeFromOpp_act(at idx: Int)

    @objc(insertOpp_act:atIndexes:)
    @NSManaged public func insertIntoOpp_act(_ values: [Log], at indexes: NSIndexSet)

    @objc(removeOpp_actAtIndexes:)
    @NSManaged public func removeFromOpp_act(at indexes: NSIndexSet)

    @objc(replaceObjectInOpp_actAtIndex:withObject:)
    @NSManaged public func replaceOpp_act(at idx: Int, with value: Log)

    @objc(replaceOpp_actAtIndexes:withOpp_act:)
    @NSManaged public func replaceOpp_act(at indexes: NSIndexSet, with values: [Log])

    @objc(addOpp_actObject:)
    @NSManaged public func addToOpp_act(_ value: Log)

    @objc(removeOpp_actObject:)
    @NSManaged public func removeFromOpp_act(_ value: Log)

    @objc(addOpp_act:)
    @NSManaged public func addToOpp_act(_ values: NSOrderedSet)

    @objc(removeOpp_act:)
    @NSManaged public func removeFromOpp_act(_ values: NSOrderedSet)

}

extension Favorites : Identifiable {

}
