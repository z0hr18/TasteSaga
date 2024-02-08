//
//  LoginController.swift
//  Taste Saga
//  Created by Zohra Guliyeva on 1/22/24.
//

import UIKit
import FirebaseAuth


class LoginController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var items = [UserStruct]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        passLogin()
    }
    @IBAction func signİnButton(_ sender: Any) {
        signIn()

    }
    
    
    //Create-a basanda kecsin diger controllere
    @IBAction func accCreateButton(_ sender: Any) {
        
    }
    
   
    @IBAction func resetPasswordButton(_ sender: Any) {
        
        
        
    }
}


extension LoginController: UITableViewDelegate {
    func passLogin() {
        UserDefaults.standard.setValue(true, forKey: "Start")
    }
    
    func signIn() {
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, 
                               password: password) { result, error in
                if let error {
                    print(error.localizedDescription)
                } else if let _ = result?.user {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(TabBarController.self)") as! TabBarController
                    self.navigationController?.show(controller, sender: nil)
                }
            }
        }
    }
    
    
    
    
    func style() {
    }
}
