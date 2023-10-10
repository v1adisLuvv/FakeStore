//
//  HomePresenter.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import Foundation

protocol HomePresentationLogic {
    func presentProducts(response: HomeModels.Products.Response)
    func presentImage(response: HomeModels.Images.Response)
}

final class HomePresenter {
    var view: HomeDisplayLogic?
}

extension HomePresenter: HomePresentationLogic {
    func presentProducts(response: HomeModels.Products.Response) {
        let products = response.products
        let viewModel = HomeModels.Products.ViewModel(products: products)
        view?.displayProducts(viewModel: viewModel)
    }
    
    func presentImage(response: HomeModels.Images.Response) {
        let viewModel = HomeModels.Images.ViewModel(url: response.url, image: response.image)
        view?.displayImage(viewModel: viewModel)
    }
}
