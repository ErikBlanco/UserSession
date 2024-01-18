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
    }
    
    //MARK: - Textfields changed
    @IBAction func textFieldChanged(_ sender: UITextField) {
        sender.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    //MARK: - Sign In button tapped
    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstants.homeId, sender: self)
    }
}

//MARK: - Sign In view model delegate
extension SignInViewController: SignInViewModelDelegate {
    func validationResult(result: Bool) {
        signInBtn.isEnabled = result
    }
}

//MARK: - TextField Delegate
extension SignInViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        signInViewModel.signInRequest = SignInRequest(email: emailTextField.text, password: passwordTextField.text)
    }
}
