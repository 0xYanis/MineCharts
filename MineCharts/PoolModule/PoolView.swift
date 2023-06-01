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
        NavigationStack {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                
                Circle()
                    .position(x:370, y: 0)
                    .foregroundColor(.orange)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Выберите используемый пул:")
                        Picker("", selection: $viewModel.segmentPoolSelection) {
                            ForEach(PoolSelection.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())

                        Text("Выберите добываемую монету:")
                        Picker("", selection: $viewModel.segmentCoinSelection) {
                            ForEach(CoinSelection.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        

                    }.padding(.horizontal)

                    Spacer()
                    
                    NavigationLink(destination: {
                        ChartsView()
                    }, label: {
                        Text("Выбрал!")
                            .foregroundColor(.orange)
                    })
                    
                }
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