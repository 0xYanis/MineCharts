//
//  HomeViewModel.swift
//  MineCharts
//
//  Created by Yanis on 13.11.2023.
//

import Combine

final class HomeViewModel: ObservableObject {
    
    @Published
    var recommendCoins: [RecommendCoin] = RecommendCoin.mockCoins
    
    func fetch() {}
}
