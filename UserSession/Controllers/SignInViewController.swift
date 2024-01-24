//
//  SignInViewController.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import UIKit

class SignInViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //MARK: - Properties
    private let signInService: SignInServiceImplementation = SignInServiceImplementation(_httpUtility: HttpUtility())
    
    lazy var signInViewModel: SignInViewModel = {
        let viewModel = SignInViewModel(_signInService: signInService)
        viewModel.signInDelegate = self
        return viewModel
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        screenInitialSetup()
    }
    
    //MARK: - Screen initial setup
    func screenInitialSetup() {
        signInBtn.isEnabled = false
        errorLabel.isHidden = true
    }
    
    //MARK: - Textfields changed
    @IBAction func textFieldChanged(_ sender: UITextField) {
        sender.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    //MARK: - Sign In button tapped
    @IBAction func signInTapped(_ sender: UIButton) {
        signInViewModel.signInUserWebService()
    }
}

//MARK: - Sign In view model delegate
extension SignInViewController: SignInViewModelDelegate {
    func validationResult(result: ValidationResult) {
        signInBtn.isEnabled = result.success
    }
    
    func apiResponseStatus(isSuccessful: Bool, response: SignInResponse?, error apiError: APIError?) {
        if isSuccessful {
            performSegue(withIdentifier: SegueConstants.homeId, sender: self)
        } else {
            print(apiError?.message ?? "Unknown error" )
            errorLabel.text = apiError?.message
            errorLabel.isHidden = false
        }
    }
}

//MARK: - TextField Delegate
extension SignInViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        signInViewModel.signInRequest = SignInRequest(email: emailTextField.text, password: passwordTextField.text)
    }
}
