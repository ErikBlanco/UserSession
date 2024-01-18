//
//  RegisterViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //MARK: - Properties
    private let registerService: RegisterServiceImplementation = RegisterServiceImplementation(_httpUtility: HttpUtility())
    
    lazy var registerViewModel: RegisterViewModel = {
        let viewModel = RegisterViewModel()
        viewModel.registerDelegate = self
        return viewModel
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button tapped action
    @IBAction func registerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.signInId, sender: self)
    }
}

//MARK: - Register ViewModel Delegate
extension RegisterViewController: RegisterViewModelDelegate {
    func validationResult(result: String) {
        
    }
    
    func temp() {
        
    }
}

