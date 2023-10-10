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
                    .frame(width: 170, height: 170, alignment: .center)
                    .background(Colors.imageBgColor)
                    .clipShape(.rect(cornerRadius: Constants.imageCornerRadius))
            } else {
                Rectangle()
                    .foregroundStyle(.green)
                    .frame(width: 170, height: 170, alignment: .center)
                    .clipShape(.rect(cornerRadius: Constants.imageCornerRadius))
            }
            
            HStack {
                CustomText(title: String(product.price) + "$",
                           size: Constants.priceTextSize,
                           color: Colors.priceColor)
                Spacer()
            }
            
            HStack {
                CustomText(title: product.title,
                           size: Constants.titleTextSize,
                           color: Colors.titleColor)
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
        }
    }
}

private enum Constants {
    static let imageCornerRadius: CGFloat = 20
    static let priceTextSize: CGFloat = 20
    static let titleTextSize: CGFloat = 15
}

private enum Colors {
    static let imageBgColor: Color = .gray
    static let priceColor: Color = .green
    static let titleColor: Color = .black
}

#Preview {
    HomeProductCell(product: Product.sampleProduct(), image: Image(systemName: "xbox.logo"))
}
