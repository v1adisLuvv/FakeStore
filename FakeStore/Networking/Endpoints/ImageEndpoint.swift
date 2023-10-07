//
//  ImageEndpoint.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import Foundation

enum ImageEndpoint {
    case image(url: String)
}

extension ImageEndpoint: EndpointType {
    var baseURL: String {
        switch self {
        case .image(url: let url):
            return url
        }
    }
    
    var path: String {
        switch self {
        case .image:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .image:
            return .get
        }
        
    }
    
    var timeoutInterval: TimeInterval {
        return 15
    }
}
