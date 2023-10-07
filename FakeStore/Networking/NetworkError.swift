//
//  NetworkError.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case unableToDecode
    case badURL
    case networkError
    case badImage
}
