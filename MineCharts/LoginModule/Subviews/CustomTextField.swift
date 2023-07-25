//
//  CustomTextField.swift
//  MineCharts
//
//  Created by Yan Rybkin on 21.07.2023.
//

import SwiftUI

struct CustomTextField : ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.alphabet)
            .padding(.horizontal, 15)
            .font(.system(size: 20))
            .frame(height: 50)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color.orange, lineWidth: 2))
            .padding(.horizontal, 30)
    }
}

extension View {
    func customTextField() -> some View {
        self.modifier(CustomTextField())
    }
}
