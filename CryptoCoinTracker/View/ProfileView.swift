//
//  ProfileView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var viewModel = ProfileViewModel()
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
    }
}

#Preview {
    ProfileView()
}
