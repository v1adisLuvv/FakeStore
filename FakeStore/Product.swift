//
//  Product.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    static func sampleProduct() -> Product {
        let rating = Rating(rate: 3.9, count: 120)
        return Product(id: 1,
                       title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                       price: 109.95,
                       description: "Your perfect pack for everyday use and walks in the forest.",
                       category: "men's clothing",
                       image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                       rating: rating)
    }
    
    static func sampleProducts() -> [Product] {
        let rating = Rating(rate: 3.9, count: 120)
        let product1 = Product(id: 1,
                       title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                       price: 109.95,
                       description: "Your perfect pack for everyday use and walks in the forest.",
                       category: "men's clothing",
                       image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                       rating: rating)
        
        let product2 = Product(id: 2,
                               title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                               price: 109.95,
                               description: "Your perfect pack for everyday use and walks in the forest.",
                               category: "men's clothing",
                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                               rating: rating)
        
        let product3 = Product(id: 3,
                               title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                               price: 109.95,
                               description: "Your perfect pack for everyday use and walks in the forest.",
                               category: "men's clothing",
                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                               rating: rating)
        
        let product4 = Product(id: 4,
                               title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                               price: 109.95,
                               description: "Your perfect pack for everyday use and walks in the forest.",
                               category: "men's clothing",
                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                               rating: rating)
        
        let product5 = Product(id: 5,
                               title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                               price: 109.95,
                               description: "Your perfect pack for everyday use and walks in the forest.",
                               category: "men's clothing",
                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                               rating: rating)
        
        return [product1, product2, product3, product4, product5]
    }
}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}
