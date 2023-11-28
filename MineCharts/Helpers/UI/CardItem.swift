//
//  CardItem.swift
//  MineCharts
//
//  Created by Yanis on 28.11.2023.
//

import SwiftUI

public struct CardItem<Header: View, Middle: View>: View {
    
    private var header: () -> Header
    private var middle: () -> Middle
    private var isDivided: Bool
    
    init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder middle: @escaping () -> Middle,
        isDivided: Bool = true
    ) {
        self.header = header
        self.middle = middle
        self.isDivided = isDivided
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    header()
                }
                .padding([.horizontal], 10)
                .padding([.vertical], 5)
                
                if isDivided { Divider() }
                
                middle()
                    .padding(.bottom, 10)
            }
        }
        .lightBackground(.gray)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .scaleByTap()
    }
    
}
