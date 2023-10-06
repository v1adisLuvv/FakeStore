//
//  HomeView.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

struct HomeView: View {

    private var gridItemLayout = Array(repeating: GridItem(.flexible()),
                                       count: Constants.numberOfColumns)
    let products = Product.sampleProducts()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: Constants.gridVerticalSpacing) {
                ForEach(products) { product in
                    HomeProductCell(product: product)
                        .frame(width: Constants.cellWidth,
                               height: Constants.cellHeight,
                               alignment: .center)
                }
            }
            .padding(.horizontal, Constants.gridHorizontalSpacing)
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
