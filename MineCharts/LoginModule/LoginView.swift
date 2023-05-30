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
        NavigationStack {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                
                Circle()
                    .position(x:100, y: 0)
                    .foregroundColor(.orange)
                
                VStack {
                    HStack {
                        Text("Привет\nМайнер !")
                            .foregroundColor(.white)
                            .font(.system(
                                size: 46,
                                weight: .heavy,
                                design: .default)
                            )
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }.padding(.horizontal, 30)
                    
                    
                    Spacer()
                    
                    
                    VStack {
                        HStack {
                            TextField(
                                "Введите хэш кошелька...",
                                text: $viewModel.walletHash
                            )
                        }
                        .keyboardType(.alphabet)
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
                            Text("Что это такое?")
                                .font(.system(
                                    size: 20,
                                    weight: .bold,
                                    design: .default)
                                )
                                .foregroundColor(.orange)
                                .padding()
                            
                        }).sheet(isPresented: $isShowingModal) {
                            LoginInfoView()
                                .presentationDetents([.fraction(0.6)])
                        }
                        
                        
                        Spacer()
                        
                        
                        NavigationLink(
                            destination: PoolView(),
                            label: {
                                Text("Начнем!")
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
                        .disabled(viewModel.showButton)
                        .opacity(viewModel.showButton ? 0.5 : 1.0)
                    }
                    .padding(.horizontal, 30)
                    Spacer()
                }
                .padding(.top, 180)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("itmo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
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
