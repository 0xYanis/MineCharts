//
//  NewsView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var model: NewsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor.ignoresSafeArea()
                feedView()
            }
            
            .navigationTitle("Последние новости")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func feedView() -> some View {
        VStack {
            List {
                ForEach(model.lastNews) { item in
                    HStack {
                        AsyncImage(url: URL(string: item.image))
                            .fixedSize()
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .cornerRadius(15)
                        
                        
                        VStack(alignment: .leading) {
                            Text(item.title)
                            
                            Text(item.newsText)
                                .foregroundColor(.gray)
                                .font(.caption2)
                                .lineLimit(3)
                        }
                    }
                }
                .onDelete(perform: model.deleteNews(at:))
                .listRowBackground(Color.backColor)
            }
            .listStyle(.plain)
        }
    }
    
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            NewsView()
        }
        .preferredColorScheme(.dark)
    }
}
