//
//  ImageCollectionViewCell.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/19/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
 
    func configurecell(image: UIImage){
        imageView.image = image
    }


}
