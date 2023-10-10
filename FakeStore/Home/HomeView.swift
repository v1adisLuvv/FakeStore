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

    private let gridItemLayout = Array(repeating: GridItem(.flexible()),
                                       count: Constants.numberOfColumns)
    
    @State private var dataStore = HomeDataStore()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: Constants.gridVerticalSpacing) {
                ForEach(dataStore.products) { product in
                    let image = dataStore.downloadedImages[product.image] ?? nil
                    HomeProductCell(product: product,
                                    image: image)
                        .frame(width: Constants.cellWidth,
                               height: Constants.cellHeight,
                               alignment: .center)
                }
            }
            .padding(.horizontal, Constants.gridHorizontalSpacing)
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
    static let gridVerticalSpacing: CGFloat = 10
    static let gridHorizontalSpacing: CGFloat = 20
    static let cellWidth: CGFloat = 170
    static let cellHeight: CGFloat = 290
}

#Preview {
    HomeView()
}
