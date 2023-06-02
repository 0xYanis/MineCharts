//
//  MineChartsApp.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

@main
struct MineChartsApp: App {
    let userDefaults = UserDefaults.standard
    
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
