//
//  ChartsMiningService.swift
//  MineCharts
//
//  Created by Yan Rybkin on 08.06.2023.
//

import Foundation
import Alamofire

protocol ChartsMiningServiceProtocol: AnyObject {
    func getRequest<T: Codable>(completion: @escaping (Result<T, Error>) -> Void)
}

final class ChartsMiningService: ChartsMiningServiceProtocol {
    
    private var apiService: APIServiceProtocol
    private var url = ""
    private var wallet = ""
    private var httpHeaders: HTTPHeaders = [
        HTTPHeader(name: "", value: "")
    ]
    
    init(wallet: String, apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        self.wallet = wallet
    }
    
    
    func getRequest<T: Codable>(
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        apiService.getRequest(
            url: url,
            headers: httpHeaders,
            completion: completion
        )
    }
}
