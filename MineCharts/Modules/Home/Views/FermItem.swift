//
//  FermItem.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct FermItem: View {
    
    var body: some View {
        CardItem {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
        } middle: {
            HStack(alignment: .center) {
                ProgressView()
            }
            .frame(maxWidth: .infinity, alignment: .center)
//            Text("Информация")
//                .foregroundColor(.gray)
//                .font(.caption2)
                .frame(height: 60)
        }
    }
}

private extension FermItem {
    var title: String {
        "Ферма"
    }
}
