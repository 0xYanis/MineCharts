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
                        ChartsStatsCell()
                            .padding(.bottom, 5)
                            .padding(.top, 15)
                        ChartsGridCell(customSize: scaleScreen(170))
                            .padding(.bottom, 5)
                        ChartsHashView()
                            .padding(.bottom, 5)
                        ChartsInfoCell(customSize: scaleScreen(115))
                            .padding(.bottom, 5)
                        ChartsRateView()
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                }
            }
            
            .toolbar {
                toolbarItems()
            }
            
            .navigationTitle(model.getMinerName())
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(model)
    }
    
    @ToolbarContentBuilder
    func toolbarItems() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            NavigationLink(destination: {
                
            }, label: {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.orange)
            })
        }
        
        ToolbarItem(placement: .navigationBarLeading) {
            NavigationLink(destination: {
                NewsView()
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
