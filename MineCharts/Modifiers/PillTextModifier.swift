//
//  PillTextModifier.swift
//  MineCharts
//
//  Created by Yanis on 17.11.2023.
//

import SwiftUI

struct PillTextModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(4)
            .background(color.gradient.opacity(0.6))
            .cornerRadius(5)
            .padding(.top, 9)
    }
    
}
