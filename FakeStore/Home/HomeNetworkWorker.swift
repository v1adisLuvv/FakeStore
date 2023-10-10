//
//  HomeNetworkWorker.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import Foundation

protocol HomeNetworkWorkerProtocol {
    func getAllProducts() async throws -> [Product]
    func getSingleProduct(id: Int) async throws -> Product
    func getAllCategories() async throws -> [String]
    func getProductsInSpecificCategory(category: String) async throws -> [Product]
}

final class HomeNetworkWorker: HomeNetworkWorkerProtocol {
    
    let networkManager: NetworkManager
    let decoder: NetworkDecoder
    
    init(networkManager: NetworkManager, decoder: NetworkDecoder) {
        self.networkManager = networkManager
        self.decoder = decoder
    }
    
    func getAllProducts() async throws -> [Product] {
        let data = try await networkManager.send(ProductsEndpoint.all)
        return try decoder.decode(data)
    }
    
    func getSingleProduct(id: Int) async throws -> Product {
        let data = try await networkManager.send(ProductsEndpoint.detail(id: id))
        return try decoder.decode(data)
    }
    
    func getAllCategories() async throws -> [String] {
        let data = try await networkManager.send(ProductsEndpoint.allCategories)
        return try decoder.decode(data)
    }
    
    func getProductsInSpecificCategory(category: String) async throws -> [Product] {
        let data = try await networkManager.send(ProductsEndpoint.category(name: category))
        return try decoder.decode(data)
    }
}
