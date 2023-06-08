//
//  ChartsInfoCell.swift
//  MineCharts
//
//  Created by Yan Rybkin on 08.06.2023.
//

import SwiftUI

struct ChartsInfoCell: View {
    
    @ObservedObject var viewModel: ChartsViewModel
    var customSize: CGFloat
    
    var didTapWorkers: Bool = false
    var didTapShares : Bool = false
    var didTapPayouts: Bool = false
    
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 10) {
                GridRow {
                    Group {
                        chartsDataView("Воркеры", "в сети", shares: "2")
                        chartsDataView("Шары", "найдено", shares: "172")
                        chartsDataView("Выплаты", "за сегодня", shares: "3")
                    }
                    .frame(width: customSize, height: customSize / 1.5)
                    .background(Color.black)
                    .cornerRadius(15)
                }
            }
        }
    }
}

private extension ChartsInfoCell {
    func chartsDataView(_ label: String,_ subLabel: String, shares: String) -> some View {
        VStack {
            Text(label)
                .foregroundColor(.orange)
                .padding(.top, 5)
            Text(subLabel)
                .font(.footnote)
                .foregroundColor(.orange)
            Spacer()
            Text(shares)
                .font(.system(size: 24, weight: .bold, design: .rounded))
            Spacer()
        }
    }
}

struct ChartsInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsInfoCell(viewModel: ChartsViewModel(), customSize: 120)
                .preferredColorScheme(.dark)
        }
    }
}
