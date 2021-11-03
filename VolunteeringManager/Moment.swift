//
//  Moment.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/17/21.
//

import Foundation
import UIKit

class Moment {
    var image: UIImage
    var author: String
    var moment: String
    
    init(image: UIImage, author: String, moment: String) {
        self.image = image
        self.author = author
        self.moment = moment
    }
}
