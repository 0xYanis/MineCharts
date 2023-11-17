//
//  TapPressGestureModifier.swift
//  MineCharts
//
//  Created by Yanis on 17.11.2023.
//

import SwiftUI

struct TapPressGestureModifier: ViewModifier {
    
    @Binding
    var state: Bool
    
    func body(content: Content) -> some View {
        content
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
