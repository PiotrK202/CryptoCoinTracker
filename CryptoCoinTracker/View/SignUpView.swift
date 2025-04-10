//
//  LoginView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: SignUpViewModel
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthYear: Int = 2025
    @State private var errorMessage: String?
    @Binding var isLoggedIn: Bool
    
    init(viewModel: SignUpViewModel, isLoggedIn: Binding<Bool>) {
        _viewModel = State(wrappedValue: viewModel)
        _isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        Form {
            Section(header: Text("Creat Account ")) {
                TextField("UserName",text: $username)
                    .accessibilityIdentifier("SignUpUserName")
                
                TextField("Email",text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .accessibilityIdentifier("SignUpEmail")
                
                SecureField("Password",text: $password)
                    .accessibilityIdentifier("SignUpPassword")
                
                TextField("Your year of birth", value: $birthYear, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .accessibilityIdentifier("SignUpBirthYear")
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            
            Button("Sign Up") {
                if let error = viewModel.validateUser(username, email, password, birthYear) {
                    errorMessage = error.uppercased()
                } else {
                    viewModel.saveUserData(username, email, password, birthYear)
                    viewModel.isLoggedIn()
                    errorMessage = nil
                    dismiss()
                }
            }
            .accessibilityIdentifier("SignUpButton")
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(sessionHelper: SessionHelper()), isLoggedIn: .constant(false))
}
