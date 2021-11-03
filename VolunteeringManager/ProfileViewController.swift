//
//  ProfileViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/16/21.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldStreetAddress: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldZipCode: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        
        textFieldFirstName.useUnderline()
        textFieldLastName.useUnderline()
        textFieldStreetAddress.useUnderline()
        textFieldCity.useUnderline()
        textFieldState.useUnderline()
        textFieldZipCode.useUnderline()
        textFieldEmail.useUnderline()
        textFieldPhone.useUnderline()

        if users!.count >= 1 {
            textFieldFirstName.text = users![0].first_name
            textFieldLastName.text = users![0].last_name
            textFieldStreetAddress.text = users![0].address
            textFieldCity.text = users![0].city
            textFieldState.text = users![0].state
            textFieldZipCode.text = users![0].zip_code
            textFieldEmail.text = users![0].email
            textFieldPhone.text = users![0].phone
            if users![0].image_blob != nil {
                profileImage.image = UIImage(data: users![0].image_blob! as Data)
            }
            // need to load the profile image previously picked
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func BrowseBtnClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func SaveBtnClicked(_ sender: Any) {
        if users!.count >= 1 {
            let user = users![0]
            user.first_name = textFieldFirstName.text
            user.last_name = textFieldLastName.text
            user.address = textFieldStreetAddress.text
            user.city = textFieldCity.text
            user.state = textFieldState.text
            user.zip_code = textFieldZipCode.text
            user.email = textFieldEmail.text
            user.phone = textFieldPhone.text
            
            user.image_blob = profileImage.image?.jpegData(compressionQuality: 1) as Data?
            
            SaveUserSettings()
        }
    }
}

extension UITextField {
  func useUnderline() -> Void {
    let border = CALayer()
    let borderWidth = CGFloat(1.0) // Border Width
    border.borderColor = UIColor.gray.cgColor
    border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
    border.borderWidth = borderWidth
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
  }
}
