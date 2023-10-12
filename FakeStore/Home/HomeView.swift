//
//  HomeView.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

protocol HomeDisplayLogic {
    func displayProducts(viewModel: HomeModels.Products.ViewModel)
    func displayImage(viewModel: HomeModels.Images.ViewModel)
}

struct HomeView: View {
    
    var interactor: HomeBusinessLogic?
    
    @State private var dataStore = HomeDataStore()
//    @State private var products = Product.sampleProducts()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Constants.gridItemLayout,
                      spacing: Constants.gridSpacing) {
                ForEach(dataStore.products) { product in
                    let image = dataStore.downloadedImages[product.image]
                    HomeProductCell(product: product, image: image)
                }
            }
            .onAppear {
                fetchProducts()
            }
        }
    }
    
    private func fetchProducts() {
        let request = HomeModels.Products.Request()
        interactor?.loadProducts(request: request)
    }
}

extension HomeView: HomeDisplayLogic {
    func displayProducts(viewModel: HomeModels.Products.ViewModel) {
        DispatchQueue.main.async {
            dataStore.products = viewModel.products
        }
    }
    
    func displayImage(viewModel: HomeModels.Images.ViewModel) {
        DispatchQueue.main.async {
            dataStore.downloadedImages[viewModel.url] = viewModel.image
        }
    }
}

private enum Constants {
    static let numberOfColumns: Int = 2
    static let gridSpacing: CGFloat = 0
    static let flexibleGridItem = GridItem(.flexible(),
                                           spacing: gridSpacing)
    static let gridItemLayout = Array(repeating: flexibleGridItem,
                                      count: numberOfColumns)
}

#Preview {
    HomeView()
}
