//
//  Page.swift
//  MineCharts
//
//  Created by Yanis on 29.12.2023.
//

import Foundation

enum Page: Hashable {
    case home
    case coin
    case payouts
}

enum Sheet: Hashable {
    case info
    case onboarding
}

enum FullScreenCover: Hashable {
    case auth
}
