//
//  ProfileView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//
import SwiftData
import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query private var favoriteCoins: [FavoriteCoinModel]
    
    @State private var viewModel: ProfileViewModel
    @State private var isShowingSheet = false
    @Binding var isLoggedIn: Bool
    private let noAvailableText = "Not available"
    
    init(viewModel: ProfileViewModel, isLoggedIn: Binding<Bool>) {
        _isLoggedIn = isLoggedIn
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        Form {
            Section(header: Text("User info")) {
                Text("UserName: \(viewModel.userName ?? noAvailableText)")
                    .padding()
                
                Text("Email: \(viewModel.email ?? noAvailableText)")
                    .padding()
                
                Text("Your Birth Year: \(viewModel.birthYear ?? noAvailableText)")
            }
            Section("Your coins") {
                ForEach(favoriteCoins, id: \.self) { coin in
                    VStack {
                        Text(coin.name)
                        
                        Text("\(String(describing: coin.currentPrice ?? 0.0))")
                    }
                }
                .onDelete { IndexSet in
                    for index in IndexSet {
                        let coinDelete = favoriteCoins[index]
                        modelContext.delete(coinDelete)
                    }
                    try? modelContext.save()
                }
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("Add Coin To Observe")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(Color.primary)
                }
            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            SheetViewForAddingCoin(viewModel: SheetViewModelForAddingCoinsc(coinRepository: Repository(dataService: DataService())))
            {  selectedCoin in
                let newCoin = FavoriteCoinModel(name: selectedCoin.name, currentPrice: selectedCoin.currentPrice)
                modelContext.insert(newCoin)
                try? modelContext.save()
            }
        })
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(role: .destructive) {
                    viewModel.deletCoin(modelContext)
                    viewModel.loggOut()
                    dismiss()
                } label: {
                    Text("Log Out")
                        .padding()
                }
                Button("delete profile") {
                    KeychainHelper.shared.deletUser()
                    viewModel.deletCoin(modelContext)
                    viewModel.loggOut()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(sessionHelper: SessionHelper()), isLoggedIn: .constant(true))
}
