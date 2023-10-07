//
//  NetworkDecoder.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import Foundation

/// Object responsible for decoding JSON objects received from the network
protocol NetworkDecoder {
    /// Decodes JSON object
    /// - Parameter data: Data received from the network, must conform Decodable
    /// - Returns: The object of the specified type
    func decode<T: Decodable>(_ data: Data) throws -> T
}

final class DefaultNetworkDecoder: NetworkDecoder {
    
    private let jsonDecoder = JSONDecoder()
    
    // MARK: NetworkDecoder
    func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}
