//
//  HomeProductCell.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

struct HomeProductCell: View {
    
    let product: Product
    let image: Image?
    
    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: Constants.imageMinWidth,
                           maxWidth: .infinity,
                           minHeight: Constants.imageMinHeight,
                           maxHeight: .infinity)
                    .clipped()
                    .aspectRatio(Constants.imageAspectRatio,
                                 contentMode: .fit)
                    .background(Colors.imageBgColor)
                    .clipShape(.rect(cornerRadius: Constants.imageCornerRadius))
            } else {
                Image(systemName: "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: Constants.imageMinWidth,
                           maxWidth: .infinity,
                           minHeight: Constants.imageMinHeight,
                           maxHeight: .infinity)
                    .clipped()
                    .aspectRatio(Constants.imageAspectRatio,
                                 contentMode: .fit)
                    .background(Colors.imageBgColor)
                    .clipShape(.rect(cornerRadius: Constants.imageCornerRadius))
            }
            
            HStack {
                CustomText(title: "$" + String(product.price),
                           size: Constants.priceTextSize,
                           color: Colors.priceColor)
                Spacer()
            }
            
            HStack {
                CustomText(title: product.title,
                           size: Constants.titleTextSize,
                           color: Colors.titleColor)
                .lineLimit(2)
                Spacer()
            }
            
            Button {
                print("add to cart")
            } label: {
                CustomText(title: "Add to cart",
                           size: 15,
                           color: .white)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    Color.blue
                }
                .clipShape(.rect(cornerRadius: 10))
                
            }
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
    }
}

private enum Constants {
    static let imageCornerRadius: CGFloat = 20
    static let imageAspectRatio: CGFloat = 1
    static let imageMinWidth: CGFloat = 0
    static let imageMinHeight: CGFloat = 0
    static let priceTextSize: CGFloat = 20
    static let titleTextSize: CGFloat = 15
}

private enum Colors {
    static let imageBgColor: Color = .clear
    static let priceColor: Color = .green
    static let titleColor: Color = .black
}

#Preview {
    HomeProductCell(product: Product.sampleProduct(), image: Image(systemName: ""))
}
