//
//  ChartsViewCell.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI

struct ChartsViewCell: View {
    var body: some View {
        customCellView(
            name: "Доходность",
            result: "$0.004 BTC"
        )
    }
}

private extension ChartsViewCell {
    func customCellView(name: String, result: String) -> some View {
        VStack {
            Text(name)
                .foregroundColor(.orange)
            Text(result)
        }
        .font(.system(size: 22, weight: .medium, design: .default))
        .padding()
        .background(Color.init(hex: "#12345"))
        .cornerRadius(10)
    }
}

struct ChartsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartsViewCell()
            .preferredColorScheme(.dark)
    }
}
