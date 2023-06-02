//
//  ChartsGridCell.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import SwiftUI

struct ChartsGridCell: View {
    
    @ObservedObject var viewModel: ChartsViewModel
    var customSize: CGFloat
    
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        VStack {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 150))],
                spacing: 0
            ) {
                Group {
                    chartsProfitView(profit: "0.0412")
                        .frame(width: customSize, height: customSize / 2)
                    
                    chartsHashView(power: "123Mh/s")
                        .frame(width: customSize, height: customSize / 2)
                }
                .background(Color.black)
                .cornerRadius(10)
            }
        }
    }
}

private extension ChartsGridCell {
    func chartsProfitView(profit: String) -> some View {
        VStack {
            Text("Доходность")
                .foregroundColor(.orange)
                .padding(.top, 5)
            Spacer()
            Text(profit)
                .font(.system(size: 28, weight: .bold, design: .default))
            Spacer()
        }
    }
    
    func chartsHashView(power: String) -> some View {
        VStack {
            Text("Мощность")
                .foregroundColor(.orange)
                .padding(.top, 5)
            Spacer()
            Text(power)
                .font(.system(size: 28, weight: .bold, design: .default))
            Spacer()
        }
    }
}

struct ChartsGridCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsGridCell(viewModel: ChartsViewModel(), customSize: 190)
                .preferredColorScheme(.dark)
        }
    }
}
