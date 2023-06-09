//
//  ChartsHashView.swift
//  MineCharts
//
//  Created by Yan Rybkin on 01.06.2023.
//

import SwiftUI
import Charts

struct ChartsHashView: View {
    
    @ObservedObject var model: ChartsViewModel
    
    @State private var isLineGraph: Bool = false
    @State private var hashTitle = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Hashrate")
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    
                    Picker("", selection: $model.currentTab) {
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
                    let value = hashTitle.isEmpty ? "\(model.totalValue.stringFormat) Mh/s" : hashTitle
                    Text(value)
                        .fontDesign(.rounded)
                        .font(.largeTitle.bold())
                    
                    Toggle(isOn: $isLineGraph) {}
                }
                
                AnimatedChart()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.black.shadow(.drop(radius: 2)))
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}

private extension ChartsHashView {
    @ViewBuilder
    func AnimatedChart() -> some View {
        if isLineGraph {
            Chart(model.hashrate) {
                LineMark(
                    x: .value("Часы", $0.hour),
                    y: .value("Хешрейт", $0.hash)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.orange.gradient)
                
                AreaMark(
                    x: .value("Часы", $0.hour),
                    y: .value("Хешрейт", $0.hash)
                )
                .foregroundStyle(.opacity(0.3))
                
                RuleMark(
                        y: .value("Threshold", 48)
                    )
                    .foregroundStyle(.red)
            }
            .chartOverlay { proxy in
                createChartOverlay(proxy: proxy)
            }
        } else {
            Chart(model.hashrate) {
                BarMark(
                    x: .value("Часы", $0.hour),
                    y: .value("Хешрейт", $0.hash)
                )
                .foregroundStyle(.orange.gradient)
                RuleMark(
                        y: .value("Threshold", 48)
                    )
                    .foregroundStyle(.red)
            }
            .chartOverlay { proxy in
                createChartOverlay(proxy: proxy)
            }
        }
        
    }
    
    func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> Double? {
        let relativeYPosition = location.y - geometry[proxy.plotAreaFrame].origin.y
        
        if let value = proxy.value(atY: relativeYPosition) as Double? {
            var minDistance: TimeInterval = .infinity
            var index: Int? = nil
            
            for salesDataIndex in model.hashrate.indices {
                let nthSalesDataDistance = model.hashrate[salesDataIndex].hash.distance(to: value)
                if abs(nthSalesDataDistance) < minDistance {
                    minDistance = abs(nthSalesDataDistance)
                    index = salesDataIndex
                }
            }
            
            if let index {
                return model.hashrate[index].hash
            }
        }
        
        return nil
    }
    
    func createChartOverlay(proxy: ChartProxy) -> some View {
        GeometryReader { geometry in
            Rectangle().fill(.clear).contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let origin = geometry[proxy.plotAreaFrame].origin
                            let size = geometry[proxy.plotAreaFrame].size
                            let minY = origin.y
                            let maxY = origin.y + size.height
                            let y = value.location.y
                            if y >= minY && y <= maxY {
                                let hashValue = findElement(
                                    location: value.location,
                                    proxy: proxy,
                                    geometry: geometry
                                ) ?? 0.0
                                self.hashTitle = "\(hashValue.stringFormat) Mh/s"
                            }
                        }
                        .onEnded { value in
                            self.hashTitle = "\(model.totalValue.stringFormat) Mh/s"
                        }
                )
        }
    }
}


struct ChartsHashView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backColor.ignoresSafeArea()
            ChartsHashView(model: ChartsViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
