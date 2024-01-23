//
//  StartedController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 1/22/24.
//

import UIKit

class StartedController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func startButton(_ sender: Any) {
        passController()
    }
}

extension StartedController {
    func passController() {
        let controller = storyboard?.instantiateViewController(identifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
}
