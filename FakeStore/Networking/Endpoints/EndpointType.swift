//
//  EndpointType.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

/// Protocol describing an endpoint that contains baseURL, path, method and timeout
protocol EndpointType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var timeoutInterval: TimeInterval { get }
}
