//
//  HttpUtility.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import FirebaseAuth
import Foundation

enum HTTPMethod: String, CaseIterable {
    case POST = "POST"
    case GET = "GET"
}

protocol FirebaseResponse {
    
}

struct HttpUtility {
//    func postApiData<T:Decodable>(requestUrl: String, method: HTTPMethod, requestBody: Encodable, resultType: T.Type, completionHandler: @escaping(_ result: T?, _ apiError: APIError?) -> Void) {
//        // Due to not having an active service, we directly use our database layer
//        switch requestUrl {
//        case "register":
//            print("")
//            break;
//        case "signIn":
//            break;
//        default:
//            print("")
//        }
//    }
    
    func registerUser(request: RegisterRequest, completionHandler: @escaping (_ result: String, _ apiError: APIError?)-> Void) {
        Auth.auth().createUser(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                print("Error creating user. \(error.localizedDescription)")
                _ = completionHandler("Error", APIError.requestFailed)
            } else {
                if let authResult {
                    _ = completionHandler("Success", nil)
                }
            }
        }
    }
}
