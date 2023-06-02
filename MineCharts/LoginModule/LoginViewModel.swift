//
//  LoginViewModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var minerName = ""
    @Published var walletHash = ""
    @Published var showButton = false
    @Published var isButtonTapped = false
    
    init() {
        $minerName
            .combineLatest($walletHash)
            .map { name, hash in
                name.count < 4 || hash.count < 4
            }
            .assign(to: &$showButton)
    }
    
    func buttonPressed() {
        let standard = UserDefaults.standard
        standard.set(walletHash, forKey: "walletHash")
        standard.set(minerName, forKey: "minerName")
        
        let authToken = "authToken"
        standard.set(authToken, forKey: "authToken")
    }
}

