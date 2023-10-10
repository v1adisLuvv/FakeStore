//
//  HomeDataStore.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

@Observable
final class HomeDataStore {
    var products: [Product] = []
    var downloadedImages: [String: Image?] = [:]
}
