//
//  PoolView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI

struct PoolView: View {
    
    @StateObject var viewModel: PoolViewModel = PoolViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PoolView_Previews: PreviewProvider {
    static var previews: some View {
        PoolView()
    }
}
