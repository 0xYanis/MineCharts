//
//  PoolViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI
import Combine

final class PoolViewModel: ObservableObject {
    
    @Published var segmentPoolSelection: PoolSelection = .ftwopools
    @Published var segmentCoinSelection: CoinSelection = .btc
    
    init() {
        
    }
    
}
