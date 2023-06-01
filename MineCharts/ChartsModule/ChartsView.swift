//
//  ChartsView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 30.05.2023.
//

import SwiftUI

struct ChartsView: View {
    
    @StateObject private var viewModel = ChartsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack(spacing: 20) {
                        
                    }
                    
                    
                    
                    Spacer()
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
            
            .navigationTitle("F2Pool")
        }
    }
}

private extension ChartsView {
    
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
            .preferredColorScheme(.dark)
    }
}
