//
//  EndpointType.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

/// Protocol describing an endpoint that contains url, host, path, method and timeout
protocol EndpointType {
    var url: URL? { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
    var timeoutInterval: TimeInterval { get }
}
