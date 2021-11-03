//
//  ViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    var radius = 10
    @IBOutlet weak var userMessageLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        userNameTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        signInButton.layer.cornerRadius = 5
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func SingInButtonClicked(_ sender: Any) {
        
        fetchUser()
        
        if let textUserName = self.userNameTextField.text, textUserName.isEmpty {
            userMessageLabel.text = "Please fill in the User Name."
            return
        } else if let textPassword = self.passwordTextField.text, textPassword.isEmpty {
            userMessageLabel.text = "Please fill in the password."
            return
        }
        
        checkUsername(userName : self.userNameTextField.text!,
                      password : self.passwordTextField.text!)
        
        
    }
    
    @IBAction func SignUpButtonClicked(_ sender: Any) {
    }

//
// We need to enahnce the logic here.  A fundamental question we need to consider:
// Do we allow multiple users on the same phone.  If yes, how do we switch user here?
// If no, then how to make sure we only allow the previous user name to be logged in.
// Maybe only ask for password if the user table is not empty?  In such case, do we allow remove
// a user from the phone if the user choose to?
//

    func checkUsername(userName : String! , password : String!) {
        
        Network.shared.apollo.fetch(query: LoginQuery(userName:userName , password:password)) {
            result in
            switch result {
            case .success(let response):
                let firstName = response.data?.login?.firstName ?? ""
                let lastName = response.data?.login?.lastName ?? ""
                let email = response.data?.login?.email ?? ""
                if !firstName.isEmpty || !lastName.isEmpty {
                    users![0].loggedIn = true
                    users![0].first_name = firstName;
                    users![0].last_name = lastName;
                    users![0].email = email;
                    
                    SaveUserSettings()
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                    
                    // This is to get the SceneDelegate object from your view controller
                    // then call the change root view controller function to change to main tab bar
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                    
                } else {
                    let errorMessage = (response.errors?[0])?.message
                    print("Failure! Error: \(errorMessage)")
                }
                
            case .failure(let error):
                // whatever error handling you want to do
                print("Failure! Error: \(error)")
            }
        }
    }
    
    
    
}

