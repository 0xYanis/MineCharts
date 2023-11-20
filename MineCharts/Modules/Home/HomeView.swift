//
//  HomeView.swift
//  MineCharts
//
//  Created by Yanis on 13.11.2023.
//

import SwiftUI
import SafeSFSymbols

struct HomeView: View {
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    private var gridItems: [GridItem] {
        Array(
            repeating: GridItem(.flexible()),
            count: 2
        )
    }
    
    var body: some View {
        ScrollView {
            RecommendView()
                .padding([.top, .horizontal])
            LazyVGrid(
                columns: gridItems,
                alignment: .center) {
                    CoinItem()
                    FermItem()
                }
                .padding(.horizontal)
            Text("График")
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .lightBackground(.gray)
                .cornerRadius(10)
                .padding(.horizontal)
            Spacer()
        }
        .environmentObject(viewModel)
    }
}

struct RecommendView: View {
    
    @State
    private var isHighlighted = false
    
    @EnvironmentObject
    private var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Рекомендация:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        
                    } label: {
                        Image(.info.circle).foregroundColor(.blue)
                    }
                }
                .font(.title3)
                .padding(10)
                Divider()
                    .padding(.leading, 10)
                labelsScrollView()
                    .padding([.leading, .bottom], 10)
            }
        }
        .background(Color.gray.gradient.opacity(0.15))
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .scaleEffect(isHighlighted ? 0.95 : 1.0)
        .tapAndPressGesture($isHighlighted)
    }
    
    @ViewBuilder
    private func labelsScrollView() -> some View {
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
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
