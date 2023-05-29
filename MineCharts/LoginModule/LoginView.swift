//
//  LoginView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            
            Circle()
                .position(x:100, y: 0)
                .foregroundColor(.orange)
            
            VStack {
                HStack {
                    Text("Welcome Back !")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .heavy, design: .default))
                        .frame(width: 300)
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        TextField("Entry Your wallet hash...", text: $viewModel.walletHash)
                    }
                    .padding(.horizontal, 15)
                    .font(.system(size: 22))
                    .frame(height: 50)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.orange, lineWidth: 2)
                    )
                    .padding(.horizontal)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("What is it?")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.orange)
                            .padding()
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("--------->")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                    })
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("MineCharts. Version: 0.1")
                        .foregroundColor(.gray)
                    Text("0xYanis. ITMO University")
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.top, 200)
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
