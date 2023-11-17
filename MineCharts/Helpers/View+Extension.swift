//
//  View+Extension.swift
//  MineCharts
//
//  Created by Yanis on 17.11.2023.
//

import SwiftUI

extension View {
    func pilledText(_ color: Color = Color.random) -> some View {
        modifier(PillTextModifier(color: color))
    }
}

extension View {
    func tapAndPressGesture(_ state: Binding<Bool>) -> some View {
        modifier(TapPressGestureModifier(state: state))
    }
}
