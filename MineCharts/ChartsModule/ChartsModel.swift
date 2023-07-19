//
//  ChartsModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import Foundation

struct ChartsModel: Identifiable, Codable {
    var id = UUID()
    var hour: Date
    var hash: Double
}

var hashChart: [ChartsModel] = [
    ChartsModel(hour: Date().updateHour(value: 0), hash: 43.45),
    ChartsModel(hour: Date().updateHour(value: 1), hash: 55.67),
    ChartsModel(hour: Date().updateHour(value: 2), hash: 48.12),
    ChartsModel(hour: Date().updateHour(value: 3), hash: 46.98),
    ChartsModel(hour: Date().updateHour(value: 4), hash: 49.86),
    ChartsModel(hour: Date().updateHour(value: 5), hash: 51.45),
    ChartsModel(hour: Date().updateHour(value: 6), hash: 43.78),
    ChartsModel(hour: Date().updateHour(value: 7), hash: 55.65),
    ChartsModel(hour: Date().updateHour(value: 8), hash: 44.76),
    ChartsModel(hour: Date().updateHour(value: 9), hash: 37.89),
    ChartsModel(hour: Date().updateHour(value: 10), hash: 49.21),
    ChartsModel(hour: Date().updateHour(value: 11), hash: 55.99),
    ChartsModel(hour: Date().updateHour(value: 12), hash: 48.67),
    ChartsModel(hour: Date().updateHour(value: 13), hash: 41.09),
    ChartsModel(hour: Date().updateHour(value: 14), hash: 42.56),
    ChartsModel(hour: Date().updateHour(value: 15), hash: 54.12),
    ChartsModel(hour: Date().updateHour(value: 16), hash: 66.08),
    ChartsModel(hour: Date().updateHour(value: 17), hash: 43.98),
    ChartsModel(hour: Date().updateHour(value: 18), hash: 37.76),
    ChartsModel(hour: Date().updateHour(value: 19), hash: 49.34),
    ChartsModel(hour: Date().updateHour(value: 20), hash: 66.08),
    ChartsModel(hour: Date().updateHour(value: 21), hash: 43.98),
    ChartsModel(hour: Date().updateHour(value: 22), hash: 37.76),
    ChartsModel(hour: Date().updateHour(value: 23), hash: 49.34)
]

struct RateModel: Identifiable {
    var id = UUID()
    var hour: Date
    var price: Double
}

var rateChart: [RateModel] = [
    RateModel(hour: Date().updateHour(value: 0), price: 13.23),
    RateModel(hour: Date().updateHour(value: 1), price: 12.25),
    RateModel(hour: Date().updateHour(value: 2), price: 13.21),
    RateModel(hour: Date().updateHour(value: 3), price: 14.22),
    RateModel(hour: Date().updateHour(value: 4), price: 15.24),
    RateModel(hour: Date().updateHour(value: 5), price: 18.20),
    RateModel(hour: Date().updateHour(value: 6), price: 22.15),
    RateModel(hour: Date().updateHour(value: 7), price: 29.17),
    RateModel(hour: Date().updateHour(value: 8), price: 22.19),
    RateModel(hour: Date().updateHour(value: 9), price: 21.18),
    RateModel(hour: Date().updateHour(value: 10), price: 20.16),
    RateModel(hour: Date().updateHour(value: 11), price: 18.14),
    RateModel(hour: Date().updateHour(value: 12), price: 19.12),
    RateModel(hour: Date().updateHour(value: 13), price: 19.13),
    RateModel(hour: Date().updateHour(value: 14), price: 16.11),
    RateModel(hour: Date().updateHour(value: 15), price: 16.10),
    RateModel(hour: Date().updateHour(value: 16), price: 16.08),
    RateModel(hour: Date().updateHour(value: 17), price: 30.07),
    RateModel(hour: Date().updateHour(value: 18), price: 27.05),
    RateModel(hour: Date().updateHour(value: 19), price: 28.06),
    RateModel(hour: Date().updateHour(value: 20), price: 28.08),
    RateModel(hour: Date().updateHour(value: 21), price: 19.07),
    RateModel(hour: Date().updateHour(value: 22), price: 19.05),
    RateModel(hour: Date().updateHour(value: 23), price: 20.06)
]

