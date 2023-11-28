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
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
            Button {
                
            } label: {
                Image(.info.circle)
                    .foregroundColor(.blue)
                    .font(.title3)
            }
        } middle: {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.recommendCoins, id: \.id) { coin in
                        Text(coin.text)
                            .pilledText(coin.color)
                            .onTapGesture {
                                
                            }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
    
}

private extension RecommendView {
    var title: String {
        "Рекомендация:"
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
