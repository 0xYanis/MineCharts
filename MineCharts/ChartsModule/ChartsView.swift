//
//  ChartsView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    @StateObject private var viewModel = ChartsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor.ignoresSafeArea()
                
                ScrollView {
                    ChartsGridCell(viewModel: viewModel, customSize: scaleScreen(170))
                        .padding(.horizontal)
                        .padding(.top, 15)
                        .padding(.bottom, 5)
                    
                    ChartsHashView(viewModel: viewModel)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    ChartsInfoCell(viewModel: viewModel, customSize: scaleScreen(115))
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    ChartsRateView(viewModel: viewModel)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: {
                        
                    }, label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.orange)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        
                    }, label: {
                        Text("Шары")
                            .foregroundColor(.orange)
                    })
                }
            }
            .navigationTitle(viewModel.getMinerName())
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension ChartsView {
    func scaleScreen(_ value : CGFloat) -> CGFloat{
        let x = UIScreen.main.bounds.width/393
        return value * x
    }
}





struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
            .preferredColorScheme(.dark)
    }
}
