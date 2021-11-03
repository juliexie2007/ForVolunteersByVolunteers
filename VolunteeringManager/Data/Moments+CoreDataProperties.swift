//
//  Moments+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/20/21.
//
//

import Foundation
import CoreData


extension Moments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Moments> {
        return NSFetchRequest<Moments>(entityName: "Moments")
    }

    @NSManaged public var author: String?
    @NSManaged public var post: String?
    @NSManaged public var dateTime: Date?
    @NSManaged public var moment_images: NSSet?

}

// MARK: Generated accessors for moment_images
extension Moments {

    @objc(addMoment_imagesObject:)
    @NSManaged public func addToMoment_images(_ value: MomentImages)

    @objc(removeMoment_imagesObject:)
    @NSManaged public func removeFromMoment_images(_ value: MomentImages)

    @objc(addMoment_images:)
    @NSManaged public func addToMoment_images(_ values: NSSet)

    @objc(removeMoment_images:)
    @NSManaged public func removeFromMoment_images(_ values: NSSet)

}

extension Moments : Identifiable {

}
