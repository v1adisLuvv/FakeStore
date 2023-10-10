//
//  CartsEndpoint.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

enum CartsEndpoint {
    case getCart(userID: Int)
    case addCart
}

extension CartsEndpoint: EndpointType {
    
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
        case .getCart(userID: let userID):
            return "/carts/user/\(userID)"
        case .addCart:
            return "/carts"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCart:
            return .get
        case .addCart:
            return .post
        }
    }
    
    var timeoutInterval: TimeInterval {
        return 10
    }
}
