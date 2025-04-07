//
//  CoinDetialView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import SwiftUI

struct CoinDetialView: View {
    @State private var viewModel: CoinDetailViewModel
    @State private var isShowingSheet = false
    
    init(viewModel: CoinDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: viewModel.coin.image ?? "" )) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width:200, height: 200)
                    } else if phase.error != nil {
                        ImageDownloadErrorView()
                    } else {
                        ProgressView()
                    }
                }
            }
            Text(viewModel.coin.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
            
            VStack(alignment:.leading, spacing: 12) {
                Text("coin ath:\(viewModel.coin.ath ?? 0.0)")
                
                Text("coin ath date:\(viewModel.coin.athDate ?? "")")
                
                Text("coin price change:\(viewModel.coin.priceChange24H ?? 0.0)")
                
                Text("coin market cap change: \(viewModel.coin.marketCapChange24H ?? 0.0)")
            }
            .padding()
            
            Text("See the SparklineIn7D")
                .padding()
                .onTapGesture {
                    isShowingSheet.toggle()
                }
        }
        .navigationTitle("Details")
        .sheet(isPresented: $isShowingSheet) {
            if let priceData = viewModel.coin.sparklineIn7D?.price {
                ChartSparklineIn7DView(price: priceData)
            } else {
                Text("no price Data available")
            }
        }
    }
}
#Preview {
    CoinDetialView(viewModel: CoinDetailViewModel(coin: CoinModel.example))
}
