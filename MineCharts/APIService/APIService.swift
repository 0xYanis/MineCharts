//
//  APIService.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import Foundation
import Alamofire

protocol APIServiceProtocol: AnyObject {
    func getRequest<T: Codable>(url: String, headers: HTTPHeaders, completion: @escaping (Result<T, Error>) -> Void)
}

final class APIService: APIServiceProtocol {
    
    typealias handler<T> = (Result<T, Error>) -> Void
    
    func getRequest<T: Codable>(
        url: String,
        headers: HTTPHeaders,
        completion: @escaping handler<T>
    ) {
        performRequest(
            url: url,
            method: .get,
            headers: headers,
            completion: completion
        )
    }
}

private extension APIService {
    func performRequest<T: Codable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        completion: @escaping handler<T>
    ) {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
