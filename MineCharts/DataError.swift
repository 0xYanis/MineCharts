//
//  DataError.swift
//  MineCharts
//
//  Created by Yanis on 27.11.2023.
//

import Foundation

enum DataError: String, Error {
    case badEncoding
    case badDecoding
    case saveGetFailed
    case fetchGetFailed
    case deleteGetFailed
}
