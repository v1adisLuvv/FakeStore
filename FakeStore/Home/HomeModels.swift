//
//  HomeModels.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

enum HomeModels {
    enum Products {
        struct Request {}
        
        struct Response {
            let products: [Product]
        }
        
        struct ViewModel {
            let products: [Product]
        }
    }
    
    enum Images {
        struct Request {}
        
        struct Response {
            let url: String
            let image: Image?
        }
        
        struct ViewModel {
            let url: String
            let image: Image?
        }
    }
}
