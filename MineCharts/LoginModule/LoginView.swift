//
//  LoginView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 29.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: Private properties
    @StateObject private var viewModel = LoginViewModel()
    @State private var isShowingModal: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                
                Circle()
                    .position(x:100, y: 0)
                    .foregroundColor(.orange)
                loginScreen()
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
    
    @ViewBuilder
    func loginScreen() -> some View {
        VStack {
            customText(text: "Привет,\nМайнер !")
            Spacer()
            
            TextField("Дайте имя майнеру...", text: $viewModel.minerName)
                .customTextField()
                .padding(.vertical, 20)
            TextField("Дайте имя майнеру...", text: $viewModel.minerName)
                .customTextField()
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
    }
    
    @ViewBuilder
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
