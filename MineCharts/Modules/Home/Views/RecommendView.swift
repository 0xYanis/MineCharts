//
//  RecommendView.swift
//  MineCharts
//
//  Created by Yanis on 20.11.2023.
//

import SwiftUI

struct RecommendView: View {
    
    @EnvironmentObject
    private var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Рекомендация:")
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    Button {
                        
                    } label: {
                        Image(.info.circle).foregroundColor(.blue)
                    }
                }
                .font(.title3)
                .padding(10)
                Divider()
                    .padding(.leading, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<4) { id in
                            Text("Novacoin")
                                .pilledText()
                                .onTapGesture {
                                    
                                }
                        }
                    }
                }
                .padding([.leading, .bottom], 10)
            }
        }
        .lightBackground(.gray)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .scaleByTap()
    }
    
}
