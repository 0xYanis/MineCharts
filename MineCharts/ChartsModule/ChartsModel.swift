//
//  ChartsModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import Foundation

struct ChartsModel: Identifiable {
    var id = UUID()
    var hour: Date
    var hash: Double
    var animate: Bool = false
}

var sample_analytics: [ChartsModel] = [
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
    ChartsModel(hour: Date().updateHour(value: 19), hash: 49.34)
]
