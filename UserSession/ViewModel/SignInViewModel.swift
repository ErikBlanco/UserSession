//
//  SignInViewModel.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol SignInViewModelDelegate: BaseProtocols {

}

class SignInViewModel: ObservableObject {
    weak var signInDelegate: SignInViewModelDelegate?
    private let signInService: SignInService
    
    @Published var signInRequest: SignInRequest? {
        didSet {
            validateForm()
        }
    }
    
    init(_signInService: SignInService) {
        self.signInService = _signInService
    }
    
    private func validateForm() {
        let validationResult = SignInValidation().Validate(signInRequest: signInRequest!)
        signInDelegate?.validationResult(result: validationResult)
    }
}
