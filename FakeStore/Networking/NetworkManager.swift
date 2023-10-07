//
//  NetworkManager.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

protocol NetworkManager {
    func send<Response: Decodable, Endpoint: EndpointType>(_ route: Endpoint) async throws -> Response
    func loadImage(from url: String) async throws -> Data
}
