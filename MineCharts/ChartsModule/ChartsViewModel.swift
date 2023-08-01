//
//  ChartsViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import Foundation
import Combine

final class ChartsViewModel: ObservableObject {
    
    @Published var hashrate: [ChartsModel] = hashChart
    @Published var exchange: [RateModel] = rateChart
    @Published var currentTab: String = "День"
    @Published var currentActiveItem: ChartsModel?
    @Published var totalValue: Double = 0.0
    
    private var service: ChartsMiningServiceProtocol
    
    private var cancellables: Set<AnyCancellable> = []

    init(
        service: ChartsMiningServiceProtocol = ChartsMiningService()
    ) {
        self.service = service
        configureCurrentHash()
    }
    
    private func configureCurrentHash() {
        $hashrate.combineLatest($currentTab)
            .sink { [unowned self] (hashrate, _) in
                let averageHash = hashrate
                    .reduce(0.0) { $0 + $1.hash } / Double(hashrate.count)
                self.totalValue = averageHash
            }
            .store(in: &cancellables)
    }
    
    func getMinerName() -> String {
        let key = "minerName"
        let userData = UserDefaults.standard
        return userData.string(forKey: key) ?? "Miner"
    }
    
    deinit {
        cancellables.removeAll()
    }
    
}
