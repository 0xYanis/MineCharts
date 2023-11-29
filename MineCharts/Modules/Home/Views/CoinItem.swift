//
//  CoinItem.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct CoinItem: View {
    
    var body: some View {
        CardItem {
            HeaderText(title)
        } middle: {
            HStack(alignment: .center) {
                ProgressView()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 60)
        }
    }
}

private extension CoinItem {
    var title: String {
        "Монета"
    }
}
