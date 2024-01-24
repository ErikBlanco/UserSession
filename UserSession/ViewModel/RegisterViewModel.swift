//
//  RegisterViewModel.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import FirebaseAuth
import Foundation

protocol RegisterViewModelDelegate: BaseProtocols {
    func apiResponseStatus(isSuccessful: Bool, response: RegisterResponse?, error: APIError?)
}

class RegisterViewModel: ObservableObject {
    weak var registerDelegate: RegisterViewModelDelegate?
    private let registerService: RegisterService
    
    @Published var registerRequest: RegisterRequest? {
        didSet {
            validateForm()
        }
    }
    
    init(_registerService: RegisterService) {
        self.registerService = _registerService
    }
    
    private func validateForm() {
        let validationResult = RegisterValidation().Validate(registerRequest: registerRequest!)
        registerDelegate?.validationResult(result: validationResult)
    }
    
    // Replaced by registerUserWebServiceHandler
    func registerUserWebService() {
        registerService.register(registerRequest: registerRequest!) { [weak self] result in
            switch result {
            case .success(let response):
                self?.registerDelegate?.apiResponseStatus(isSuccessful: true, response: response, error: nil)
            case .failure(let error):
                self?.registerDelegate?.apiResponseStatus(isSuccessful: false, response: nil, error: error)
            }
        }
    }
    
    func registerUserWebServiceHandler(completion: @escaping (Result<RegisterResponse?, APIError>) -> Void) {
        registerService.register(registerRequest: registerRequest!) { [weak self] result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
