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
    private(set) var title: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backColor.ignoresSafeArea()
                
                ScrollView {
                    ChartsGridCell(viewModel: viewModel, customSize: scaleScreen(170))
                        .padding(.horizontal)
                        .padding(.top, 15)
                        .padding(.bottom, 5)
                    
                    ChartsGraphView(viewModel: viewModel)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .top
                        )
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
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        
                    }, label: {
                        Text("Шары")
                            .foregroundColor(.orange)
                    })
                }
            }
            .navigationTitle(title)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            
            .onChange(of: viewModel.currentTab) { newValue in
                viewModel.sampleAnalytics = sample_analytics
                if newValue != "7 Days" {
                    for (index,_) in viewModel.sampleAnalytics.enumerated() {
                        viewModel.sampleAnalytics[index].views = .random(in: 1500...10000)
                    }
                }
                animateGraph(fromChange: true)
            }
        }
    }
}

private extension ChartsView {
    func animateGraph(fromChange: Bool = false) {
        let delay = fromChange ? 0.03 : 0.05
        for (index, _) in viewModel.sampleAnalytics.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * delay) {
                let animation = fromChange ?
                Animation.easeInOut(duration: 0.8) :
                Animation.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)
                withAnimation(animation) {
                    viewModel.sampleAnalytics[index].animate = true
                }
            }
        }
    }
    
    func scaleScreen(_ value : CGFloat) -> CGFloat{
        let x = UIScreen.main.bounds.width/393
        return value * x
    }

    func scaleScreen_y(_ value : CGFloat) -> CGFloat{
        let y = UIScreen.main.bounds.height/852
        return value * y
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView(title: "Coin")
            .preferredColorScheme(.dark)
    }
}
