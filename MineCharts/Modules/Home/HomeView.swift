//
//  HomeView.swift
//  MineCharts
//
//  Created by Yanis on 13.11.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    var body: some View {
        Text("Hello, HomeView!")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
