//
//  SignInRequest.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct SignInRequest: Encodable {
    let email: String?
    let password: String?
}
