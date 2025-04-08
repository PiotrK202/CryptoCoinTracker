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
        }
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
