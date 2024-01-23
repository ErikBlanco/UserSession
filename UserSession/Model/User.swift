//
//  User.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

// Part of SwiftData approach attempt. Discarded.

import SwiftData
import Foundation

@Model
class User {
    @Attribute(.unique) let id = UUID()
    var email: String
    var password: String
    var isActive: Bool
    
    init(email: String, password: String, isActive: Bool) {
        self.email = email
        self.password = password
        self.isActive = isActive
    }
}
