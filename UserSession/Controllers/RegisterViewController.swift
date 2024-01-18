//
//  RegisterViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    lazy var registerViewModel: RegisterViewModel = {
        let viewModel = RegisterViewModel()
        viewModel.registerDelegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.signInId, sender: self)
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func validationResult(result: String) {
        
    }
    
    func temp() {
        
    }
}

