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
    
    private var gridItems: [GridItem] {
        Array(
            repeating: GridItem(.flexible()),
            count: 2
        )
    }
    
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
            Spacer()
        }
        .environmentObject(viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}