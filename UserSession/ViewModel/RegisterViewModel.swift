//
//  RegisterViewModel.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol RegisterViewModelDelegate: BaseProtocols {

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
}
