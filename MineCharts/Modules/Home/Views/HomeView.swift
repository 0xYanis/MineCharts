//
//  HomeView.swift
//  MineCharts
//
//  Created by Yanis on 13.11.2023.
//

import SwiftUI
import SafeSFSymbols

struct HomeView: View {
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            RecommendView()
                .padding([.top, .horizontal])
            LazyVGrid(
                columns: gridItems,
                alignment: .center) {
                    CoinItem()
                    FermItem()
                }
                .padding(.horizontal)
            HomeChart()
                .padding(.horizontal)
            Spacer()
        }
        .environmentObject(viewModel)
        .navigationTitle("Miner")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Private methods & computed properties

private extension HomeView {
    
    var gridItems: [GridItem] {
        Array(
            repeating: GridItem(.flexible()),
            count: 2
        )
    }
    
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
#endif
