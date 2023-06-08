//
//  Date+Extension.swift
//  MineCharts
//
//  Created by Yan Rybkin on 08.06.2023.
//

import Foundation

extension Date {
    func updateHour(value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}
