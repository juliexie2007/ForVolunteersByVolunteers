//
//  AddNewMomentViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/18/21.
//

import UIKit

class AddNewMomentViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var MomentIamge: UIImageView!
    @IBOutlet weak var textNewPost: UITextView!
    @IBOutlet weak var btnBrower: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var users:[Users]?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        
        if bShowMomentDetail { // this is to show an existing moment post
            btnCancel.isHidden = true
            btnPost.isHidden = true
            btnBrower.isHidden = true
            self.navigationItem.rightBarButtonItem?.title = ""
            btnRemove.isHidden = true
            if num_moment < moment_list.count {
                textNewPost.text = moment_list[num_moment].post
//                MomentIamge.image = UIImage(data: moment_list[num_moment].image_post! as Data)
            }
        }
    }
    
    @IBAction func BrowseButtonClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func RemoveButtonClicked(_ sender: Any) {
        MomentIamge.image = nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            MomentIamge.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PostANewMoment" {
            let newPost = CreateANewPost()
            newPost.author = users![0].first_name! + " " +  users![0].last_name!
            newPost.dateTime = Date()
            newPost.post = textNewPost.text
/*
            newPost.image_post = MomentIamge.image?.jpegData(compressionQuality: 1) as Data?
  */
            SaveUserSettings ()
            moment_list.append(newPost)
        }
    }

/*
    @IBAction func PostBtnClicked(_ sender: Any) {
        let newPost = Moments(context: self.context)
        newPost.author = users![0].first_name! + " " +  users![0].last_name!
        newPost.dateTime = Date()
        newPost.post = textNewPost.text
        newPost.image_post = MomentIamge.image?.jpegData(compressionQuality: 1) as Data?
         
        do {
            try self.context.save()
        }
        catch {
            
        }
        moment_list.append(newPost)
        btnPost.isEnabled = false
        btnBrower.isEnabled = false
        btnRemove.isEnabled = false
        textNewPost.isEditable = false
    }
*/

    
}
