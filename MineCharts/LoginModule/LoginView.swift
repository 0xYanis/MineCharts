//
//  LoginView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    @State private var isShowingModal = false
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            
            Circle()
                .position(x:100, y: 0)
                .foregroundColor(.orange)
            
            VStack {
                HStack {
                    Text("Welcome\nBack !")
                        .foregroundColor(.white)
                        .font(.system(size: 46, weight: .heavy, design: .default))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                }.padding(.horizontal, 30)
                
                Spacer()
                
                VStack {
                    HStack {
                        TextField(
                            "Entry your wallet hash...",
                            text: $viewModel.walletHash
                        )
                    }
                    .padding(.horizontal, 15)
                    .font(.system(size: 20))
                    .frame(height: 50)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.orange, lineWidth: 2)
                    )
                    .padding(.horizontal, 30)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isEditing.toggle()
                        hideKeyboard()
                        isShowingModal.toggle()
                    }, label: {
                        Text("What is it?")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.orange)
                            .padding()
                        
                    }).sheet(isPresented: $isShowingModal) {
                        LoginInfoView()
                            .presentationDetents([.fraction(0.6)])
                    }
                    
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Let's go!")
                            .font(.system(
                                size: 20,
                                weight: .bold,
                                design: .default)
                            )
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                    })
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                VStack {
                    Text("MineCharts. Version: 0.1")
                    Text("0xYanis. ITMO University")
                }
                .foregroundColor(.gray)
                .ignoresSafeArea(.keyboard)
                
            }
            .padding(.top, 180)
        }
        .onTapGesture {
            isEditing.toggle()
            hideKeyboard()
        }
        
    }
}

private extension LoginView {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
