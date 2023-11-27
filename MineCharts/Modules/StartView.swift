//
//  ContentView.swift
//  MineCharts
//
//  Created by Yanis on 13.11.2023.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Miner")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
