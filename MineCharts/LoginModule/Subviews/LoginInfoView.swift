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
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Описание приложения")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy, design: .default))
                    
                    Spacer()
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Мы предлагаем сервис, который агрегирует данные майнинга различных криптовалют с разных пулов.")
                    
                    Text("Наше приложение предоставляет пользователям доступ к актуальной информации о доходности майнинга, текущей сложности сети, количестве добытых блоков и наградах.")
                    
                    Text("Данное прилоежение является проектом магистерской диссертационной работы.")
                }
                .foregroundColor(.white)
                .font(.system(size: 16))
                .padding()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Понятно")
                        .foregroundColor(.orange)
                        .font(.system(size: 20, weight: .heavy, design: .default))
                })
                
                
                Spacer()
                
                VStack {
                    Text("MineCharts. Version: 0.1")
                    Text("0xYanis. ITMO University")
                }
                .foregroundColor(.gray)
            }
            
        }
    }
}

struct LoginInfo_Previews: PreviewProvider {
    static var previews: some View {
        LoginInfoView()
            .preferredColorScheme(.dark)
    }
}
