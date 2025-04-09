//
//  ChartSparklineIn7DView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import SwiftUI
import Charts

struct ChartSparklineIn7DView: View {
    @Environment(\.dismiss) private var dissmiss
    let price: [Double]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("7 Day Chart")
                    .font(.title)
                
                Chart {
                    ForEach(Array(price.enumerated()), id: \.offset) { index, price in
                        LineMark(x: .value("day", index), y: .value("price", price))
                            .interpolationMethod(.monotone)
                            .foregroundStyle(.blue)
                    }
                }
                .chartYScale(domain: price.min()!...price.max()!)
                .frame(height: 200)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName:"xmark")
                        .onTapGesture {
                            dissmiss()
                        }
                }
            }
        }
    }
}

#Preview {
    ChartSparklineIn7DView(price: [0.0,0.1])
}
