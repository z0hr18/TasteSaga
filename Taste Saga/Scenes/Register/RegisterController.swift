//
//  RegisterController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/3/24.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var fullnameTF: UITextField!
   
    
    var onLogin: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   

    
    
    @IBAction func signUpButton(_ sender: Any) {
        signUp()
    }
    
    @IBAction func signUpGoogle(_ sender: Any) {
    }
    
}

extension RegisterController {
    func signUp() {
        if let email = emailTextfield.text,
           let password = passwordTextfield.text,
           let fullname = fullnameTF.text  {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let user = result?.user {
                    var user = UserStruct(fullname: fullname, email: email, password: "")
                                       self?.onLogin?(user.email ?? "", password)
                                       self?.navigationController?.popViewController(animated: true)
//                    print(user)
                }
                
            }
        }
    }
}
