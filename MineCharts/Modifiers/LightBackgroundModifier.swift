//
//  LightBackgroundModifier.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct LightBackgroundModifier: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .background(color.gradient.opacity(0.15))
    }
}
