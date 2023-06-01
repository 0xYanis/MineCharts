//
//  LoginInfoView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

struct LoginInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Мы предлагаем сервис, который агрегирует данные майнинга различных криптовалют с разных пулов.")
                        
                        Text("Наше приложение предоставляет пользователям доступ к актуальной информации о доходности майнинга, текущей сложности сети, количестве добытых блоков и наградах.")
                        
                        Text("Данное прилоежение является проектом магистерской диссертационной работы.")
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
}

struct LoginInfo_Previews: PreviewProvider {
    static var previews: some View {
        LoginInfoView()
            .preferredColorScheme(.dark)
    }
}
