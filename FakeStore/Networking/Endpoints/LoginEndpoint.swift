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
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    var host: String {
        return "fakestoreapi.com"
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
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
