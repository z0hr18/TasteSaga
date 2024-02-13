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
//        if let email = emailTextfield.text,
//           let password = passwordTextfield.text {
//            Auth.auth().signIn(withEmail: email,
//                               password: password) { result, error in
//                if let error {
//                    print(error.localizedDescription)
//                } else if let _ = result?.user {
//                    
//                }
//            }
//        }
        print("test")

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
    
//    func changeRoot() {
//        class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//            var window: UIWindow?
//            func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//                let windowScene = UIWindowScene(session: session, connectionOptions: connectionOptions)
//                self.window = UIWindow(windowScene: windowScene)
//                let storyboard = UIStoryboard(name: "MyStoryboardName", bundle: nil)
//                guard let rootVC = storyboard.instantiateViewController(identifier: "ViewControllerIdentifierName") as? ViewController else {
//                    print("ViewController not found")
//                    return
//                }
//                let rootNC = UINavigationController(rootViewController: rootVC)
//                self.window?.rootViewController = rootNC
//                self.window?.makeKeyAndVisible()
//            }
//        }
//    }
    
    
    func signIn() {
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, 
                               password: password) { result, error in
                if let error {
                    print(error.localizedDescription)
                } else if let _ = result?.user {
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let sceneDelegate = scene.delegate as? SceneDelegate {
                        sceneDelegate.tabbarRoot(windowScene: scene)
                    }
                }
            }
        }
    }
    
    func style() {
    }
}
