//
//  CardItem.swift
//  MineCharts
//
//  Created by Yanis on 28.11.2023.
//

import SwiftUI

public struct CardItem<Header: View, Middle: View>: View {
    
    private var isDivided: Bool
    private var header: () -> Header
    private var middle: () -> Middle
    
    init(
        isDivided: Bool = true,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder middle: @escaping () -> Middle
    ) {
        self.isDivided = isDivided
        self.header = header
        self.middle = middle
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
