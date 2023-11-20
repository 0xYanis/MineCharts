//
//  CoinItem.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct CoinItem: View {
    
    var body: some View {
        VStack {
            Text("Монета")
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.gray.gradient.opacity(0.15))
                .cornerRadius(10)
        }
    }
}

struct CoinItem_Previews: PreviewProvider {
    static var previews: some View {
        CoinItem()
    }
}
