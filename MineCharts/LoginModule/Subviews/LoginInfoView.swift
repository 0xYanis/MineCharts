//
//  LoginInfoView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

fileprivate enum LoginInfo : String {
    case first = "Мы предлагаем сервис, который агрегирует данные майнинга различных криптовалют с разных пулов."
    case second = "Наше приложение предоставляет пользователям доступ к актуальной информации о доходности майнинга, текущей сложности сети, количестве добытых блоков и наградах."
    case third = "Данное прилоежение является проектом магистерской диссертационной работы."
}

struct LoginInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                loginScreen()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Понятно")
                            .foregroundColor(.orange)
                    })
                }
            }
            
            .navigationBarTitle("Описание")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func loginScreen() -> some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(LoginInfo.first.rawValue)
                Text(LoginInfo.second.rawValue)
                Text(LoginInfo.third.rawValue)
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer()
            
            VStack {
                Text("MineCharts. Version: 0.1")
                Text("0xYanis. ITMO University")
            }
            .foregroundColor(.gray)
        }
    }
    
    
}

struct LoginInfo_Previews: PreviewProvider {
    static var previews: some View {
        LoginInfoView()
            .preferredColorScheme(.dark)
    }
}
