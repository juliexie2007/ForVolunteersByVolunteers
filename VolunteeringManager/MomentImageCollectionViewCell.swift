//
//  MomentImageCollectionViewCell.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/20/21.
//

import UIKit

class MomentImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    func configurecell(image: UIImage){
        imageView.image = image
    }

  
}
