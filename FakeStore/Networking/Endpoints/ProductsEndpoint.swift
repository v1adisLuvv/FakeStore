//
//  ProductsEndpoint.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

enum ProductsEndpoint {
    case all
    case detail(id: Int)
    case allCategories
    case category(name: String)
}

extension ProductsEndpoint: EndpointType {
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
        case .all:
            return "/products"
        case .detail(id: let id):
            return "/products/\(id)"
        case .allCategories:
            return "/products/categories"
        case .category(name: let name):
            return "/products/categories/\(name)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .all:
            return .get
        case .detail:
            return .get
        case .allCategories:
            return .get
        case .category:
            return .get
        }
    }
    
    var timeoutInterval: TimeInterval {
        return 10
    }
}
