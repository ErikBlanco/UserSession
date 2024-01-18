//
//  DatabaseService.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation
import SwiftData

class DatabaseService {
    static var shared = DatabaseService()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: User.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print("Error initializing database service: \(error.localizedDescription)")
        }
    }
    
    func saveUser(user: User?) {
        guard let user else {return }
        if let context {
            context.insert(user)
        }
    }
    
    func fetchUsers(onCompletion:@escaping([User]?,Error?)->(Void)){
          let descriptor = FetchDescriptor<User>(sortBy: [SortDescriptor<User>(\.email)])
          if let context{
              do{
                  let data = try context.fetch(descriptor)
                  onCompletion(data, nil)
              }
              catch{
                  onCompletion(nil, error)
              }
          }
     }
}
