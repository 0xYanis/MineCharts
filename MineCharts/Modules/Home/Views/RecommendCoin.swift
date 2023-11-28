//
//  RecommendCoin.swift
//  MineCharts
//
//  Created by Yanis on 28.11.2023.
//

import Foundation
import SwiftUI

struct RecommendCoin: Identifiable {
    var id = UUID().uuidString
    var text: String
    var color: Color
    
    static var mockCoins: [RecommendCoin] = [
        .init(text: "BTC", color: .red),
        .init(text: "ETH", color: .green),
        .init(text: "NOVA", color: .blue),
        .init(text: "TRON", color: .primary),
        .init(text: "NEXA", color: .purple)
    ]
}
