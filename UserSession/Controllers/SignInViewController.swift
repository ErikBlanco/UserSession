//
//  SignInViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.homeId, sender: self)
    }
}

