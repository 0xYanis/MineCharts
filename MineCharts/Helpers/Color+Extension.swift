//
//  Color+Extension.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

extension Color {
    static let backColor = Color(hex: "#21222c")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(red: Double((rgb & 0xFF0000) >> 16) / 255.0,
                  green: Double((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: Double(rgb & 0x0000FF) / 255.0)
    }
}
