//
//  NewsApiService.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import Foundation

protocol NewsApiServiceProtocol : AnyObject {
    
}

final class NewsApiService : NewsApiServiceProtocol {
    
    init() {
        
    }
    
    private var createURL: URL? {
        let tunnel = "https://"
        let server = ""
        let endpoint = ""
        let params = ""
        let urlString = tunnel + server + endpoint + params
        
        return URL(string: urlString)
    }
    
    
    
}
