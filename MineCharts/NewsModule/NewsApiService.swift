//
//  NewsApiService.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import Foundation

protocol NewsApiServiceProtocol : AnyObject {
    func fetchData<T:Codable>() async throws -> [T]
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
    
    func fetchData<T:Codable>() async throws -> [T] {
        guard let url = createURL else { throw NetworkError.badURL }
        let session = URLSession.shared
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode([T].self, from: data)
        return result
    }
    
}

enum NetworkError: Error {
    case badURL
    case badRequest
    case badResponse
    case invalidData
}
