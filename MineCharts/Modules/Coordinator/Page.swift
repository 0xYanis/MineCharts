//
//  Page.swift
//  MineCharts
//
//  Created by Yanis on 29.12.2023.
//

import Foundation

enum Page: String, Identifiable {
    case home
    case coin
    case payouts
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case info
    case onboarding
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case auth
    
    var id: String {
        self.rawValue
    }
}
