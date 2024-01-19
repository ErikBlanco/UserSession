//
//  SignInViewModel.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol SignInViewModelDelegate: BaseProtocols {
    func apiResponseStatus(isSuccessful: Bool, response: SignInResponse?, error: APIError?)
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
    
    func signInUserWebService() {
        signInService.signIn(signInRequest: signInRequest!) { [weak self] result in
            switch result {
            case .success(let response):
                self?.signInDelegate?.apiResponseStatus(isSuccessful: true, response: response, error: nil)
            case .failure(let error):
                self?.signInDelegate?.apiResponseStatus(isSuccessful: false, response: nil, error: error)
            }
        }
    }
}
