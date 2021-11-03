//
//  Users+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by emily deng on 10/27/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var distance: Float
    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var image_blob: Data?
    @NSManaged public var last_name: String?
    @NSManaged public var loggedIn: Bool
    @NSManaged public var phone: String?
    @NSManaged public var state: String?
    @NSManaged public var zip_code: String?
    @NSManaged public var covid: Bool
    @NSManaged public var virtual: Bool

}

extension Users : Identifiable {

}
