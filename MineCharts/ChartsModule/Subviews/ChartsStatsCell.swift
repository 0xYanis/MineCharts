//
//  ChartsStatsCell.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import SwiftUI

struct ChartsStatsCell: View {
    
    @ObservedObject var model: ChartsViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Монета: ETC (ETchash)")
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Детально ")
                            .foregroundColor(.orange)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.orange)
                    }

                }
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

private extension ChartsStatsCell {
    @ViewBuilder
    func createStatsCell() -> some View {
        
    }
}

struct ChartsStatsCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsStatsCell(model: ChartsViewModel())
        }
        .preferredColorScheme(.dark)
    }
}
