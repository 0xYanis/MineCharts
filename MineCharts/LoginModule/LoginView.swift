//
//  LoginView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: Private properties
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
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
                    customText(text: "Привет,\nМайнер !")
                    Spacer()
                    
                    customTextField("Дайте имя майнеру...", text: $viewModel.minerName)
                        .padding(.vertical, 20)
                    customTextField("Введите хэш кошелька...", text: $viewModel.walletHash)
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            isEditing.toggle()
                            hideKeyboard()
                            isShowingModal.toggle()
                        }, label: {
                            Text("Что это?")
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
                            destination: PoolView()
                                .onAppear {
                                    viewModel.buttonPressed()
                                },
                            label: {
                                Text("Начнем!")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .padding(.horizontal)
                                    .background(Color.orange)
                                    .cornerRadius(25)
                            })
                            .opacity(viewModel.showButton ? 0.5 : 1.0)
                            .disabled(viewModel.showButton)
                    }
                    .padding(.horizontal, 30)
                    Spacer()
                }
                .padding(.top, 180)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("itmo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
            }
        }
    }
}

//MARK: - Private methods
private extension LoginView {
    func customText(text: String) -> some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
                .font(.system(
                    size: 46,
                    weight: .heavy,
                    design: .default)
                )
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.horizontal, 30)
    }
    
    
    func customTextField(_ label: String, text: Binding<String>) -> some View {
        VStack {
            HStack {
                TextField(label, text: text)
            }
            .keyboardType(.alphabet)
            .padding(.horizontal, 15)
            .font(.system(size: 20))
            .frame(height: 50)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color.orange, lineWidth: 2))
            .padding(.horizontal, 30)
        }
    }
    
    
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
