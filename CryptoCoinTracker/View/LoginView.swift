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
    @State private var viewModel: LoginViewModel
    @State private var userName = ""
    @State private var password = ""
    @State private var errorMessage: String?
    
    init(viewModel: LoginViewModel, isLoggedIn: Binding<Bool>) {
        _isLoggedIn = isLoggedIn
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $userName)
                    .accessibilityIdentifier("LoginUserName")
                
                SecureField("Password", text: $password)
                    .accessibilityIdentifier("LoginPassword")
                
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
                        viewModel.isLoggedIn()
                        errorMessage = nil
                        dismiss()
                    }
                }
                .accessibilityIdentifier("LoginButton")
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(sessionMenager: SessionHelper()), isLoggedIn: .constant(false))
}
