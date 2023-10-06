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
    var baseURL: URL {
        let urlString = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlString) else { fatalError("wrong base URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .all:
            return ""
        case .detail(id: let id):
            return "/\(id)"
        case .allCategories:
            return "/categories"
        case .category(name: let name):
            return "/categories/\(name)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .all:
            return .get
        case .detail(id: _):
            return .get
        case .allCategories:
            return .get
        case .category(name: _):
            return .get
        }
    }
    
    var timeoutInterval: TimeInterval {
        return 10
    }
}
