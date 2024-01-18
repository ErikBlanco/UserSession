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
    @IBOutlet weak var registerBtn: UIButton!
    
    //MARK: - Properties
    private let registerService: RegisterServiceImplementation = RegisterServiceImplementation(_httpUtility: HttpUtility())
    
    lazy var registerViewModel: RegisterViewModel = {
        let viewModel = RegisterViewModel(_registerService: registerService)
        viewModel.registerDelegate = self
        return viewModel
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        screenInitialSetup()
    }
    
    //MARK: - Screen Initial Setup
    func screenInitialSetup() {
        registerBtn.isEnabled = false
    }
    
    //MARK: - Textfields changed
    @IBAction func textFieldChanged(_ sender: UITextField) {
        sender.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    //MARK: - Button tapped action
    @IBAction func registerTapped(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: SegueConstants.signInId, sender: self)
    }
}

//MARK: - Register ViewModel Delegate
extension RegisterViewController: RegisterViewModelDelegate {
    func validationResult(result: Bool) {
        registerBtn.isEnabled = result
    }
}

//MARK: - TextField Delegate
extension RegisterViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        registerViewModel.registerRequest = RegisterRequest(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text)
    }
}

