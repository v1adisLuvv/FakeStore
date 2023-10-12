//
//  HomeInteractor.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

protocol HomeBusinessLogic {
    func loadProducts(request: HomeModels.Products.Request)
}

final class HomeInteractor {
    
    var presenter: HomePresentationLogic?
    var networkWorker: HomeNetworkWorkerProtocol?
    var imageDownloader: ImageDownloader?
}

extension HomeInteractor: HomeBusinessLogic {
    func loadProducts(request: HomeModels.Products.Request) {
        Task {
            do {
                let products = try await networkWorker?.getAllProducts() ?? []
                loadImages(for: products)
                let response = HomeModels.Products.Response(products: products)
                presenter?.presentProducts(response: response)
            } catch {
                print(error)
            }
        }
    }
    
    private func loadImages(for products: [Product]) {
        for product in products {
            Task {
                let url = product.image
                do {
                    let image = try await imageDownloader?.loadImage(from: url)
                    let response = HomeModels.Images.Response(url: url, image: image)
                    presenter?.presentImage(response: response)
                } catch {
                    print(error)
                }
            }
        }
    }
}
