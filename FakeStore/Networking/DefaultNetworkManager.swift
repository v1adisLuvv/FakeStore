//
//  DefaultNetworkManager.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import Foundation

final class DefaultNetworkManager: NetworkManager {
    
    private let imageTimeoutInterval: TimeInterval = 15
    
    // MARK: - NetworkManager
    func send<Response: Decodable, Endpoint: EndpointType>(_ route: Endpoint) async throws -> Response {
        let data = try await request(route)
        return try decode(data)
    }
    
    func loadImage(from url: String) async throws -> Data {
        do {
            let request = try buildRequest(from: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            if let responseError = handleResponse(response) {
                throw responseError
            }
            return data
        } catch {
            throw NetworkError.networkError
        }
    }
    
    // MARK: Private - Perform request
    private func request<Endpoint: EndpointType>(_ route: Endpoint) async throws -> Data {
        do {
            let request = buildRequest(from: route)
            let (data, response) = try await URLSession.shared.data(for: request)
            if let responseError = handleResponse(response) {
                throw responseError
            }
            return data
        } catch {
            throw NetworkError.networkError
        }
    }
    
    // MARK: Private - Build request
    private func buildRequest<Endpoint: EndpointType>(from route: Endpoint) -> URLRequest {
        let url: URL = route.baseURL.appending(path: route.path)
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeoutInterval: TimeInterval =  route.timeoutInterval
        var request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = route.httpMethod.rawValue
        return request
    }
    
    private func buildRequest(from url: String) throws -> URLRequest {
        guard let url = URL(string: url) else {
            throw NetworkError.badImageURL
        }
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeoutInterval: TimeInterval = imageTimeoutInterval
        let request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        return request
    }
    
    // MARK: Private - Handle response
    private func handleResponse(_ response: URLResponse) -> NetworkError? {
        guard let response = response as? HTTPURLResponse else {
            return NetworkError.badResponse
        }
        guard (200..<300).contains(response.statusCode) else {
            return NetworkError.badResponse
        }
        return nil
    }
    
    // MARK: Private - Decode data
    private func decode<Response: Decodable>(_ data: Data) throws -> Response {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(Response.self, from: data)
    }
}
