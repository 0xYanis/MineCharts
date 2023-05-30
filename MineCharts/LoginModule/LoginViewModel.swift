//
//  LoginViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var walletHash = ""
    @Published var showButton = false
    
    init() {
        $walletHash
            .map { !($0.count > 4) }
            .assign(to: &$showButton)
    }
}

