//
//  CustomText.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 06-10-2023.
//

import SwiftUI

struct CustomText: View {
    
    let title: String
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Text(title)
            .frame(alignment: .leading)
            .foregroundStyle(color)
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
}
