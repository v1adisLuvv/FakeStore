//
//  RequestBuilder.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import Foundation

/// Object responsible for building the URL request for a given endpoint
protocol RequestBuilder {
    /// Builds the URL request for a given endpoint
    /// - Parameter route: An endpoint object describing the baseURL, path, method and timeout
    /// - Returns: URLRequest for a given endpoint
    func buildRequest<Endpoint: EndpointType>(from route: Endpoint) throws -> URLRequest
}

final class DefaultRequestBuilder: RequestBuilder {
    
    // MARK: RequestBuilder
    func buildRequest<Endpoint: EndpointType>(from route: Endpoint) throws -> URLRequest {
        guard let baseURL = URL(string: route.baseURL) else {
            throw NetworkError.badURL
        }
        let url: URL = baseURL.appending(path: route.path)
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeoutInterval: TimeInterval = route.timeoutInterval
        var request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = route.httpMethod.rawValue
        return request
    }
}
