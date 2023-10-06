//
//  LoginEndpoint.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

enum LoginEndpoint {
    case login
}

extension LoginEndpoint: EndpointType {
    var baseURL: URL {
        let urlString = "https://fakestoreapi.com/auth/login"
        guard let url = URL(string: urlString) else { fatalError("wrong base URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
        
    }
    
    var timeoutInterval: TimeInterval {
        return 10
    }
}
