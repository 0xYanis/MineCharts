//
//  MineChartsApp.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

@main
struct MineChartsApp: App {
    private let userDefaults = UserDefaults.standard
    private let notify = NotificationHandler()
    
    init() {
        notify.askPermission()
        notify.sendNotification(date: Date(), type: "time", title: "Сложность падает!", body: "На данный момент в сети ETC наблюдается значительное движение сложности сети вниз.")
    }
    
    var body: some Scene {
        WindowGroup {
            if userDefaults.string(forKey: "authToken") != nil {
                ChartsView()
                    .preferredColorScheme(.dark)
                    .background(Color.backColor)
            } else {
                LoginView()
                    .preferredColorScheme(.dark)
                    .background(Color.backColor)
            }
        }
    }
} 
