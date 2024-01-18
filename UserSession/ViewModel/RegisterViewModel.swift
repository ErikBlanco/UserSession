//
//  RegisterViewModel.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol RegisterViewModelDelegate: BaseProtocols {
    func temp()
}

class RegisterViewModel: ObservableObject {
    weak var registerDelegate: RegisterViewModelDelegate?
}
