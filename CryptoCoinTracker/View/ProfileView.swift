//
//  ProfileView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var birthYear = ""
    
    var body: some View {
        Form {
            Section(header: Text("User info")) {
                Text("UserName: \(userName)")
                    .padding()
                
                Text("Email: \(email)")
                    .padding()
                
                Text("Your Birth Year: \(birthYear)")
                
            }
        }
        .onAppear {
            loadUserInfo()
        }
    }
    
    func loadUserInfo() {
        userName = KeychainHelper.shared.read(forKey: KeychainHelper.userName) ?? "Not Available"
        email = KeychainHelper.shared.read(forKey: KeychainHelper.email) ?? "Not Available"
        birthYear = KeychainHelper.shared.read(forKey: KeychainHelper.birthYear) ?? "Not Available"
    }
}

#Preview {
    ProfileView()
}
