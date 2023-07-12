//
//  MineChartsApp.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

@main
struct MineChartsApp: App {
    
    private let notify = NotificationHandler()
    
    init() {
        notify.askPermission()
        notify.sendNotification(
            date: Date(),
            type: "time",
            title: "Сложность падает!",
            body: "")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView : View {
    
    private let userDefaults = UserDefaults.standard
    
    var body: some View {
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
