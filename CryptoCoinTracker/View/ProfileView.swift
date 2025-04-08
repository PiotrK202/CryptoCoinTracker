//
//  ProfileView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = ProfileViewModel()
    @State private var isShowingSheet = false
    @Binding var isLoggedIn: Bool
    private let noAvailableText = "Not available"
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
            SheetViewForAddingCoin()
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(role: .destructive) {
                    KeychainHelper.shared.deletUser()
                    isLoggedIn = false
                    dismiss()
                } label: {
                    Text("Log Out")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ProfileView(isLoggedIn: .constant(true))
}
