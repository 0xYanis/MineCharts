//
//  RecommendView.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct RecommendView: View {
    
    @EnvironmentObject
    private var viewModel: HomeViewModel
    
    var body: some View {
        CardItem {
            HeaderText(title)
            
            Button(action: {}) {
                Image(.info.circle)
                    .foregroundColor(.blue)
                    .font(.title3)
            }
        } middle: {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.recommendCoins, id: \.id) { coin in
                        filledCoin(coin)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
    
    private func filledCoin(_ coin: RecommendCoin) -> some View {
        Text(coin.text)
            .pilledText(coin.color)
            .onTapGesture {
                
            }
    }
    
}

private extension RecommendView {
    var title: String {
        "Рекомендация"
    }
}

#if DEBUG
struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
#endif
