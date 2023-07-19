//
//  ChartsMiningService.swift
//  MineCharts
//
//  Created by Yan Rybkin on 08.06.2023.
//

import Foundation

protocol ChartsMiningServiceProtocol: AnyObject {
    func fetchData<T:Codable>() async throws -> [T]
}

final class ChartsMiningService: ChartsMiningServiceProtocol {
    
    private var createURL: URL? {
        let tunnel = "https://"
        let server = ""
        let endpoint = ""
        let params = ""
        let urlString = tunnel + server + endpoint + params
        
        return URL(string: urlString)
    }
    
    enum NetworkError: Error {
        case badURL
        case badRequest
        case badResponse
        case invalidData
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
