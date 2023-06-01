//
//  ChartsViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import Foundation
import Combine

final class ChartsViewModel: ObservableObject {
    
    @Published var sampleAnalytics: [ChartsModel] = sample_analytics
    @Published var currentTab: String = "7 Days"
    @Published var currentActiveItem: ChartsModel?
    @Published var totalValue: Double = 0.0
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        $sampleAnalytics.combineLatest($currentTab)
            .sink { [weak self] (sampleAnalytics, currentTab) in
                let newValue = sampleAnalytics.reduce(0.0) { partialResult, item in
                    item.views + partialResult
                }
                self?.totalValue = newValue
            }
            .store(in: &cancellables)
    }
    
}
