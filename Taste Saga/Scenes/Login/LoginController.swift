//
//  LoginController.swift
//  Taste Saga
//  Created by Zohra Guliyeva on 1/22/24.
//

import UIKit
import FirebaseFirestoreInternal


class LoginController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var items = [UserStruct]()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        passLogin()
    }
    @IBAction func signİnButton(_ sender: Any) {
     

    }
    
    
    @IBAction func accCreateButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "\(LoginController.self)") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    
    
    
    func passLogin() {
        UserDefaults.standard.setValue(true, forKey: "Start")
        
    }
    
}


extension LoginController: UITableViewDelegate {
    func style() {
        //email
        emailTextfield.layer.cornerRadius = 10
        emailTextfield.layer.shadowOpacity = 1
        emailTextfield.layer.shadowOffset = CGSize(width: -1, height: 1)
        emailTextfield.layer.shadowColor = UIColor.lightGray.cgColor
        emailTextfield.layer.borderWidth = 0.5
        emailTextfield.layer.borderColor = UIColor.lightGray.cgColor
        
        //password
        passwordTextfield.layer.cornerRadius = 10
        passwordTextfield.layer.shadowOpacity = 1
        passwordTextfield.layer.shadowOffset = CGSize.zero
        passwordTextfield.layer.shadowColor = UIColor.lightGray.cgColor
        passwordTextfield.layer.borderWidth = 0.5
        passwordTextfield.layer.borderColor = UIColor.lightGray.cgColor
        //button
//        button.layer.cornerRadius = 15
//        button.layer.shadowOpacity = 1
//        button.layer.shadowOffset = CGSize.zero
//        button.layer.shadowColor = UIColor.black.cgColor
    }
}
