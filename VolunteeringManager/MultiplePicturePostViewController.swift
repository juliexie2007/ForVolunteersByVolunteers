//
//  MultiplePicturePostViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/19/21.
//

import UIKit
import CoreData

class MultiplePicturePostViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UIImagePickerControllerDelegate  , UINavigationControllerDelegate {
    
    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var momentDetailTextView: UITextView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnBrowse: UIButton!
    @IBOutlet weak var btnClear: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesArray.removeAll()
        fetchUser()
        self.tabBarController?.tabBar.isHidden = true
        
        if bShowMomentDetail { // this is to show an existing moment post
            btnCancel.isHidden = true
            btnPost.isHidden = true
            btnBrowse.isHidden = true
            btnClear.isHidden = true
            self.navigationItem.rightBarButtonItem?.title = ""
            if num_moment < moment_list.count {
                momentDetailTextView.text = moment_list[num_moment].post
                SetCollectionViewImages()
            }
        }


//        (pictureCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        
        let layout = pictureCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self

    }
    
    func SetCollectionViewImages() {
        
        let moment_images = moment_list[num_moment].moment_images
        
        for data_image in moment_images! {
            let image = UIImage(data: (data_image as AnyObject).picture!!)
            imagesArray.append(image!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_picture", for: indexPath) as! ImageCollectionViewCell

        let image = imagesArray[indexPath.row]
        let num = imagesArray.count
        
        if num == 1 {
            cell.configurecell(image: image.imageResized(to: CGSize(width: pictureCollectionView.frame.size.width, height: pictureCollectionView.frame.size.width)))
        } else if num % 3 == 0{
            cell.configurecell(image: image.imageResized(to: CGSize(width: pictureCollectionView.frame.size.width/3, height: pictureCollectionView.frame.size.width/3)))
        } else if num % 2 == 0 {
            cell.configurecell(image: image.imageResized(to: CGSize(width: pictureCollectionView.frame.size.width/2, height: pictureCollectionView.frame.size.width/2)))
        } else {
            cell.configurecell(image: image.imageResized(to: CGSize(width: pictureCollectionView.frame.size.width/3, height: pictureCollectionView.frame.size.width/3)))
        }

        cell.contentView.clipsToBounds = true
        return cell

    }
    
    
    @IBAction func BtnBrowseClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func BtnClearClicked(_ sender: Any) {
        imagesArray.removeAll()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imagesArray.append(pickedImage)
            pictureCollectionView.reloadData()
                            
       }
        picker.dismiss(animated: true, completion: nil)
      }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PostMoment" {
            
            let newPost = CreateANewPost()
            newPost.author = users![0].first_name! + " " +  users![0].last_name!
            newPost.dateTime = Date()
            newPost.post = momentDetailTextView.text
                      
            for image in imagesArray {
                let imageData = CreateANewMomentImage()
                imageData.picture = image.jpegData(compressionQuality: 1) as Data?
                newPost.addToMoment_images(imageData)
            }
            moment_list.append(newPost)
            SaveUserSettings()
        }
    }
    
    func coreDataObjectFromImages(images: [UIImage]) -> Data? {
        let dataArray = NSMutableArray()
        
        for img in images {
            if let data = img.pngData() {
                dataArray.add(data)
            }
        }
        
        return try? NSKeyedArchiver.archivedData(withRootObject: dataArray, requiringSecureCoding: true)
    }

    func imagesFromCoreData(object: Data?) -> [UIImage]? {
        var retVal = [UIImage]()

        guard let object = object else { return nil }
        if let dataArray = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: object) {
            for data in dataArray {
                if let data = data as? Data, let image = UIImage(data: data) {
                    retVal.append(image)
                }
            }
        }
        
        return retVal
    }
    
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension NSManagedObject {
    func addObject(value: NSManagedObject, forKey key: String) {
        let items = self.mutableSetValue(forKey: key)
        items.add(value)
    }

    func removeObject(value: NSManagedObject, forKey key: String) {
        let items = self.mutableSetValue(forKey: key)
        items.remove(value)
    }
}
