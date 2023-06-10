//
//  ChartsGridCell.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import SwiftUI

struct ChartsGridCell: View {
    
    @ObservedObject var model: ChartsViewModel
    var customSize: CGFloat
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 20) {
                GridRow {
                    Group {
                        chartsProfitView(profit: "$ 2.1412")
                            .padding(.vertical)
                            .frame(width: customSize, height: customSize / 2)
                        
                        chartsHashView(power: "43 Mh/s")
                            .padding(.vertical)
                            .frame(width: customSize, height: customSize / 2)
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                }
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
            Text("В день")
                .font(.footnote)
                .foregroundColor(.orange)
            Spacer()
            Text(profit)
                .font(.system(size: 28, weight: .bold, design: .rounded))
            Spacer()
        }
    }
    
    func chartsHashView(power: String) -> some View {
        VStack {
            Text("Мощность")
                .foregroundColor(.orange)
                .padding(.top, 5)
            Text("Сейчас")
                .font(.footnote)
                .foregroundColor(.orange)
            Spacer()
            Text(power)
                .font(.system(size: 28, weight: .bold, design: .rounded))
            Spacer()
        }
    }
}

struct ChartsGridCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsGridCell(model: ChartsViewModel(), customSize: 190)
                .preferredColorScheme(.dark)
        }
    }
}
