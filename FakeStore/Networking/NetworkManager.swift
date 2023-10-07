//
//  NetworkManager.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

/// Object responsible for performing low-level URL requests
protocol NetworkManager {
    /// Sends the network request for a given endpoint
    /// - Parameter route: An endpoint object describing the baseURL, path, method and timeout
    /// - Returns: Data received from the endpoint
    func send<Endpoint: EndpointType>(_ route: Endpoint) async throws -> Data
}

final class DefaultNetworkManager: NetworkManager {
    
    private let requestBuilder: RequestBuilder
    
    init(requestBuilder: RequestBuilder) {
        self.requestBuilder = requestBuilder
    }
    
    // MARK: - NetworkManager
    func send<Endpoint: EndpointType>(_ route: Endpoint) async throws -> Data {
        let request = try requestBuilder.buildRequest(from: route)
        return try await send(request: request)
    }
    
    // MARK: Private - Perform request
    /// Performs the URL request and validates the response code
    /// - Parameter request: URLRequest configured from the Endpoint object
    /// - Returns: Data received from the URL
    private func send(request: URLRequest) async throws -> Data {
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.networkError
        }
        guard let response = response as? HTTPURLResponse,
              (200..<300).contains(response.statusCode) else {
            throw NetworkError.badResponse
        }
        return data
    }
}
