//
//  LoginController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 1/22/24.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
}


extension LoginController {
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
        button.layer.cornerRadius = 15
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowColor = UIColor.black.cgColor
    }
}
