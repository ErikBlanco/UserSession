//
//  HttpUtility.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

enum HTTPMethod: String, CaseIterable {
    case POST = "POST"
    case GET = "GET"
}

struct HttpUtility {
    func postApiData<T:Decodable>(requestUrl: URL, method: HTTPMethod, requestBody: Encodable, resultType: T.Type, completionHandler: @escaping(_ result: T?, _ apiError: APIError?) -> Void) {
        // TO DO: Request user registration
    }
}
