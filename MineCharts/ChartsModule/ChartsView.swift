//
//  ChartsView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    @StateObject private var model = ChartsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor.ignoresSafeArea()
                
                ScrollView {
                    Group {
                        ChartsStatsCell(model: model)
                            .padding(.bottom, 5)
                            .padding(.top, 15)
                        ChartsGridCell(model: model, customSize: scaleScreen(170))
                            .padding(.bottom, 5)
                        ChartsHashView(model: model)
                            .padding(.bottom, 5)
                        ChartsInfoCell(model: model, customSize: scaleScreen(115))
                            .padding(.bottom, 5)
                        ChartsRateView(model: model)
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
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
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: {
                        
                    }, label: {
                        Image(systemName: "newspaper.fill")
                            .foregroundColor(.orange)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        
                    }, label: {
                        Image(systemName: "chart.bar.xaxis")
                            .foregroundColor(.orange)
                    })
                }
            }
            .navigationTitle(model.getMinerName())
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
