//
//  ChartsGraphView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import SwiftUI
import Charts

struct ChartsGraphView: View {
    
    @ObservedObject var viewModel: ChartsViewModel
    
    @State private var isLineGraph: Bool = false
    @State private var plotWidth: CGFloat = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Мощность")
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    
                    Picker("", selection: $viewModel.currentTab) {
                        Text("День")
                            .tag("День")
                        Text("Неделя")
                            .tag("Неделя")
                        Text("Месяц")
                            .tag("Месяц")
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading, 40)
                }
                
                HStack {
                    Text(viewModel.totalValue.stringFormat)
                        .fontDesign(.rounded)
                        .font(.largeTitle.bold())
                    
                    Toggle(isOn: $isLineGraph) {}
                }
                
                AnimatedChart()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.black.shadow(.drop(radius: 2)))
            }
        }
    }
}

private extension ChartsGraphView {
    @ViewBuilder
    func AnimatedChart() -> some View {
        let max = viewModel.sampleAnalytics.max { item1, item2 in
            return item2.views > item1.views
        }?.views ?? 0
        
        Chart {
            ForEach(viewModel.sampleAnalytics) { item in
                if isLineGraph {
                    LineMark(x: .value("Hour", item.hour, unit: .hour),
                             y: .value("Views", item.animate ? item.views : 0)
                    )
                    .foregroundStyle(Color.orange.gradient)
                    .interpolationMethod(.catmullRom)
                    
                } else {
                    BarMark(x: .value("Hour", item.hour, unit: .hour),
                            y: .value("Views", item.animate ? item.views : 0)
                    )
                    .foregroundStyle(Color.orange.gradient)
                }
                
                if isLineGraph {
                    AreaMark(x: .value("Hour", item.hour, unit: .hour),
                             y: .value("Views", item.animate ? item.views : 0)
                    )
                    .foregroundStyle(Color.orange.opacity(0.1).gradient)
                    .interpolationMethod(.catmullRom)
                }
                let currentActiveItem = viewModel.currentActiveItem
                if let currentActiveItem, currentActiveItem.id == item.id {
                    RuleMark(x: .value("Hour", viewModel.currentActiveItem?.hour ?? Date() ))
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                        .offset(x: (plotWidth / CGFloat(viewModel.sampleAnalytics.count)) / 2)
                    
                        .annotation(position: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Мощность")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text(viewModel.currentActiveItem?.views.stringFormat ?? "")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            
                            .background {
                                RoundedRectangle(
                                    cornerRadius: 6,
                                    style: .continuous
                                )
                                    .fill(.white.shadow(.drop(radius: 2)))
                            }
                        }
                }
            }
        }
        .chartYScale(domain: 0...(max + 2500))
        .chartOverlay(content: { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let location = value.location
                                
                                if let date: Date = proxy.value(atX: location.x) {
                                    let calendar = Calendar.current
                                    let hour = calendar.component(.hour, from: date)
                                    if let currentItem = viewModel.sampleAnalytics.first(where: { item in
                                        calendar.component(.hour, from: item.hour) == hour
                                    }) {
                                        self.viewModel.currentActiveItem = currentItem
                                        self.plotWidth = proxy.plotAreaSize.width
                                    }
                                }
                            }.onEnded { value in
                                self.viewModel.currentActiveItem = nil
                            }
                    )
            }
        })
        .frame(height: 160)
        .onAppear {
            animateGraph()
        }
    }
    
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
}


struct ChartsGraphView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsGraphView(viewModel: ChartsViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
