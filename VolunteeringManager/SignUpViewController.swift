//
//  SignUpViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/9/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var textFieldZipCode: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPwd: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnUnregister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = false
        fetchUser()
        labelMessage.text = ""
        if users!.count >= 1 {
            textFieldFirstName.text = users![0].first_name
            textFieldLastName.text = users![0].last_name
            textFieldEmail.text = users![0].email
            textFieldPhone.text = users![0].phone
            textFieldZipCode.text = users![0].zip_code
        }
        
        textFieldFirstName.useUnderline()
        textFieldLastName.useUnderline()
        textFieldEmail.useUnderline()
        textFieldPhone.useUnderline()
        textFieldZipCode.useUnderline()
        textFieldPassword.useUnderline()
        textFieldConfirmPwd.useUnderline()

    }
    
    // Do NOT handle password yet!!!
    @IBAction func SignUpBtnClicked(_ sender: Any) {

        if users!.count >= 1 {
            users?.removeAll()
        }
            
        let user = CreateANewNewUser()
        user.first_name = textFieldFirstName.text
        user.last_name = textFieldLastName.text
        user.email = textFieldEmail.text
        user.phone = textFieldPhone.text
        user.zip_code = textFieldZipCode.text
                    
        users?.append(user)
        SaveUserSettings()

        labelMessage.textColor = UIColor.black
        labelMessage.text = "Sign Up successfully!"
    }
    
    @IBAction func UnregisterUserBtnClicked(_ sender: Any) {
        if users!.count >= 1 {
            RemoveCurrentUser()
        }
        textFieldFirstName.text = ""
        textFieldLastName.text = ""
        textFieldEmail.text = ""
        textFieldPhone.text = ""
        textFieldZipCode.text = ""
        labelMessage.text = ""
    }
}
