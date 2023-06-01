//
//  ChartsModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import Foundation

struct ChartsModel: Identifiable {
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animate: Bool = false
}

extension Date {
    func updateHour(value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}

var sample_analytics: [ChartsModel] = [
    ChartsModel(hour: Date().updateHour(value: 8), views: 1500),
    ChartsModel(hour: Date().updateHour(value: 9), views: 1735),
    ChartsModel(hour: Date().updateHour(value: 10), views: 3220),
    ChartsModel(hour: Date().updateHour(value: 11), views: 1812),
    ChartsModel(hour: Date().updateHour(value: 12), views: 947),
    ChartsModel(hour: Date().updateHour(value: 13), views: 4215),
    ChartsModel(hour: Date().updateHour(value: 14), views: 3215),
    ChartsModel(hour: Date().updateHour(value: 15), views: 2528),
    ChartsModel(hour: Date().updateHour(value: 16), views: 10000),
    ChartsModel(hour: Date().updateHour(value: 17), views: 1345),
    ChartsModel(hour: Date().updateHour(value: 18), views: 4325),
    ChartsModel(hour: Date().updateHour(value: 19), views: 6043),
    ChartsModel(hour: Date().updateHour(value: 20), views: 2345)
]
