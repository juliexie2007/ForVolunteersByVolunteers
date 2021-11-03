//
//  MomentsTableViewCell.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/17/21.
//

import UIKit

class MomentsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var momentContentLabel: UILabel!
    @IBOutlet weak var momentImageCollectionView: UICollectionView!
    
    @IBOutlet weak var momentImageCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var momentImageCollectionViewWidth: NSLayoutConstraint!
    
    
    var imagesArray = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        momentImageCollectionView.delegate = self
        momentImageCollectionView.dataSource = self
        
        let layout = momentImageCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imagesArrayGlobal = imagesArray
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell_collection: MomentImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moment_collection_cell", for: indexPath) as! MomentImageCollectionViewCell

        let image = imagesArray[indexPath.row]
        let num = imagesArray.count
/*
        if num == 1 {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: momentImageCollectionView.frame.size.width, height: momentImageCollectionView.frame.size.width)))
        } else if num % 3 == 0{
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: momentImageCollectionView.frame.size.width/3, height: momentImageCollectionView.frame.size.width/3)))
        } else if num % 2 == 0 {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: momentImageCollectionView.frame.size.width/2, height: momentImageCollectionView.frame.size.width/2)))
        } else {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: momentImageCollectionView.frame.size.width/3, height: momentImageCollectionView.frame.size.width/3)))
        }
*/
        if num == 1 {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: 348, height: 348)))
        } else if num % 3 == 0{
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: 348/3, height: 348/3)))
        } else if num % 2 == 0 {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: 348/2, height: 348/2)))
        } else {
            cell_collection.configurecell(image: image.imageResized(to: CGSize(width: 348/3, height: 348/3)))
        }

        cell_collection.contentView.clipsToBounds = true
        return cell_collection
        
    }
    

}


