//
//  RegexConstants.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct RegexConstants {
    static let validEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let predicateSelfMatches = "SELF MATCHES %@"
}
