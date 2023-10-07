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
    var baseURL: URL {
        let urlString = "https://fakestoreapi.com/carts"
        guard let url = URL(string: urlString) else { fatalError("wrong base URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .getCart(userID: let userID):
            return "/user/\(userID)"
        case .addCart:
            return ""
        }
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
