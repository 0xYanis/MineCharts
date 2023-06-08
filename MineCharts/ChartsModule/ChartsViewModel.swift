//
//  ChartsViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import Foundation
import Combine

final class ChartsViewModel: ObservableObject {
    
    @Published var hashrate: [ChartsModel] = sample_analytics
    @Published var currentTab: String = "День"
    @Published var currentActiveItem: ChartsModel?
    @Published var totalValue: Double = 0.0
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        $hashrate.combineLatest($currentTab)
            .sink { [weak self] (hashrate, currentTab) in
                let newValue = hashrate.last
                self?.totalValue = newValue?.hash ?? 0.0
            }
            .store(in: &cancellables)
    }
    
    func getMinerName() -> String {
        let name = UserDefaults.standard.string(forKey: "minerName") ?? "Miner"
        return name
    }
}
