//
//  FermItem.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct FermItem: View {
    
    var body: some View {
        VStack {
            Text("Ферма")
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .lightBackground(.gray)
                .cornerRadius(10)
        }
        .scaleByTap()
    }
    
}
