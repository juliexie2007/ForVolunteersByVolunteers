//
//  MomentImages+CoreDataProperties.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/20/21.
//
//

import Foundation
import CoreData


extension MomentImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MomentImages> {
        return NSFetchRequest<MomentImages>(entityName: "MomentImages")
    }

    @NSManaged public var picture: Data?
    @NSManaged public var moment_images: Moments?

}

extension MomentImages : Identifiable {

}
