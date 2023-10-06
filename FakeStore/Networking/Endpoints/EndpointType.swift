//
//  EndpointType.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var timeoutInterval: TimeInterval { get }
}
