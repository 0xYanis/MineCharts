//
//  ChartsRateView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 08.06.2023.
//

import SwiftUI
import Charts

struct ChartsRateView: View {
    
    @EnvironmentObject private var model: ChartsViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Курс ETC")
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("На сегодня: 01.06")
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                }
                
                AnimatedChart()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.black)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}

private extension ChartsRateView {
    @ViewBuilder
    func AnimatedChart() -> some View {
        Chart(model.exchange) {
            LineMark(x: .value("Часы", $0.hour),
                     y: .value("Цена", $0.price)
            )
        }
    }
}

struct ChartsRateView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsRateView(model: ChartsViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
