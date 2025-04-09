//
//  LoginView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var isLoggedIn: Bool
    @State private var viewModel = LoginViewModel()
    @State private var userName = ""
    @State private var password = ""
    @State private var errorMessage: String?
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $userName)
                
                SecureField("Password", text: $password)
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Button("Login") {
                    if let error = viewModel.isValidLogin(userName: userName, password: password) {
                        errorMessage = error.uppercased()
                    } else {
                        SessionHelper.isLoggedIn = true
                        errorMessage = nil
                        isLoggedIn = true
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
