//
//  HomeConfigurator.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 08-10-2023.
//

import SwiftUI

extension HomeView {
    func configureView() -> some View {
        var view = self
        
        let requestBuilder = DefaultRequestBuilder()
        let networkManager = DefaultNetworkManager(requestBuilder: requestBuilder)
        let decoder = DefaultNetworkDecoder()
        let networkWorker = HomeNetworkWorker(networkManager: networkManager, decoder: decoder)
        
        let interactor = HomeInteractor()
        
        let presenter = HomePresenter()
        
        let imageCache = DefaultImageCache()
        let imageDownloader = DefaultImageDownloader(networkManager: networkManager, imageCache: imageCache)
        
        view.interactor = interactor
        interactor.networkWorker = networkWorker
        interactor.imageDownloader = imageDownloader
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
