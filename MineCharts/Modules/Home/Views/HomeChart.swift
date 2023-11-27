//
//  HomeChart.swift
//  MineCharts
//
//  Created by Yanis on 22.11.2023.
//

import SwiftUI
import Charts

struct HomeChart: View {
    
    @EnvironmentObject
    private var viewModel: HomeViewModel
    
    // mock
    struct ValuePerCategory {
        var category: String
        var value: Double
    }
    let data: [ValuePerCategory] = [
        .init(category: "A", value: 5),
        .init(category: "B", value: 9),
        .init(category: "C", value: 7)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Chart(data, id: \.category) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
            }
            .padding(10)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .lightBackground(.gray)
        .cornerRadius(10)
        .padding(.horizontal)
        .scaleByTap()
    }
    
}

struct HomeChart_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
