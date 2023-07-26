//
//  MainModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import Foundation

enum PoolSelection : String, CaseIterable {
    case ftwopools = "F2Pool"
    case twominers = "2Miners"
    case ethermine = "Ethermine"
}

enum CoinSelection : String, CaseIterable {
    case btc = "BTC"
    case etc = "ETC"
    case nex = "NEX"
    case rvn = "RVN"
}
