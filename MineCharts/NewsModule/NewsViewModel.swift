//
//  NewsViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    
    private var newsService: NewsServiceProtocol
    @Published var lastNews: [NewsModel] = fakeNews
    
    init(newsService: NewsServiceProtocol = NewsService()) {
        self.newsService = newsService
    }
    
    func deleteNews(at offsets: IndexSet) {
        lastNews.remove(atOffsets: offsets)
    }
    
}

private extension NewsViewModel {
    
}
