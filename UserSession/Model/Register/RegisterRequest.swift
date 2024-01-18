//
//  RegisterRequest.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct RegisterRequest: Encodable {
    let email: String?
    let password: String?
    let confirmPassword: String?
}
