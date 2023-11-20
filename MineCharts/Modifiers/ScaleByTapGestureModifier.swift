//
//  ScaleByTapGestureModifier.swift
//  MineCharts
//
//  Created by Yanis on 17.11.2023.
//

import SwiftUI

struct ScaleByTapGestureModifier: ViewModifier {
    
    @State
    private var state = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(state ? 0.95 : 1.0)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { _ in
                        withAnimation(.easeInOut(duration: 0.09)) {
                            state = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            state = false
                        }
                    }
            )
    }
}
