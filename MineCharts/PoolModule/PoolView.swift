//
//  PoolView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI

enum PoolSelection : String, CaseIterable {
    case ftwopools = "F2Pool"
    case twominers = "2Miners"
    case ethermine = "Ethermine"
}

struct PoolView: View {
    
    @StateObject var viewModel: PoolViewModel = PoolViewModel()
    @State var segmentationSelection: PoolSelection = .ftwopools
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                
                Circle()
                    .position(x:100, y: 0)
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading) {
                    Text("Выберите используемый пул:")
                    
                    Picker("", selection: $segmentationSelection) {
                        ForEach(PoolSelection.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PoolView_Previews: PreviewProvider {
    static var previews: some View {
        PoolView()
            .preferredColorScheme(.dark)
    }
}
