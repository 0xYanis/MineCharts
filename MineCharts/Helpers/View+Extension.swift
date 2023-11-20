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
    func scaleByTap() -> some View {
        modifier(ScaleByTapGestureModifier())
    }
}

extension View {
    func lightBackground(_ color: Color) -> some View {
        modifier(LightBackgroundModifier(color: color))
    }
}
