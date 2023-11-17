//
//  Color+Extension.swift
//  MineCharts
//
//  Created by Yanis on 17.11.2023.
//

import SwiftUI

extension Color {
    static var random: Color {
        let red   = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue  = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
