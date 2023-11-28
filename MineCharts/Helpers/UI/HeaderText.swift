//
//  HeaderText.swift
//  MineCharts
//
//  Created by Yanis on 28.11.2023.
//

import SwiftUI

struct HeaderText: View {
    
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3)
    }
}
