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
    @IBOutlet weak var errorLabel: UILabel!
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
        errorLabel.isHidden = true
    }
    
    //MARK: - Textfields changed
    @IBAction func textFieldChanged(_ sender: UITextField) {
        sender.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    //MARK: - Button tapped action
    @IBAction func registerTapped(_ sender: UIButton) {
        registerViewModel.registerUserWebService()
    }
}

//MARK: - Register ViewModel Delegate
extension RegisterViewController: RegisterViewModelDelegate {
    func validationResult(result: ValidationResult) {
        registerBtn.isEnabled = result.success
    }
    
    func apiResponseStatus(isSuccessful: Bool, response: RegisterResponse?, error apiError: APIError?) {
        if isSuccessful {
            performSegue(withIdentifier: SegueConstants.signInId, sender: self)
        } else {
            print(apiError?.error ?? "Unknown error" )
            errorLabel.text = apiError?.error
            errorLabel.isHidden = false
        }
    }
}

//MARK: - TextField Delegate
extension RegisterViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        registerViewModel.registerRequest = RegisterRequest(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text)
    }
}
