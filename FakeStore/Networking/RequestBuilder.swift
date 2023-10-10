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
    /// - Parameter route: An endpoint object describing the url, host, path, method and timeout
    /// - Returns: URLRequest for a given endpoint
    func buildRequest<Endpoint: EndpointType>(from route: Endpoint) throws -> URLRequest
    /// Builds the URL request for an image
    /// - Parameter url: Image URL
    /// - Returns: URLRequest for a given URL
    func buildRequest(from url: String) throws -> URLRequest
}

final class DefaultRequestBuilder: RequestBuilder {
    
    // MARK: RequestBuilder
    func buildRequest<Endpoint: EndpointType>(from route: Endpoint) throws -> URLRequest {
        guard let url: URL = route.url else {
            throw NetworkError.badURL
        }
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeoutInterval: TimeInterval = route.timeoutInterval
        var request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = route.httpMethod.rawValue
        return request
    }
    
    func buildRequest(from url: String) throws -> URLRequest {
        guard let url = URL(string: url) else {
            throw NetworkError.badURL
        }
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeoutInterval: TimeInterval = Constants.urlRequestTimeout
        var request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}

private enum Constants {
    static let urlRequestTimeout: TimeInterval = 15
}
