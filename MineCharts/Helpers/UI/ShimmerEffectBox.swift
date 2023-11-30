//
//  ShimmerEffectBox.swift
//  MineCharts
//
//  Created by Yanis on 01.12.2023.
//

import SwiftUI

struct ShimmerEffectBox: View {
    
    @State
    private var startPoint = UnitPoint(x: -1.8, y: -1.2)
    @State
    private var endPoint = UnitPoint(x: 0, y: -0.2)
    
    private var colors: [Color] = [
        Color(uiColor: .systemGray5),
        Color(uiColor: .systemGray6),
        Color(uiColor: .systemGray5)
    ]
    
    init(_ colors: [Color] = []) {
        if !colors.isEmpty {
            self.colors = colors
        }
    }
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint)
        .onAppear(perform: loopAnimation)
    }
    
    private func loopAnimation() {
        withAnimation(
            .easeInOut(duration: 1)
            .repeatForever(autoreverses: false)
        ) {
            startPoint = .init(x: 1, y: 1)
            endPoint = .init(x: 2.2, y: 2.2)
        }
    }
    
}

struct ShimmerEffectBox_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffectBox()
    }
}
