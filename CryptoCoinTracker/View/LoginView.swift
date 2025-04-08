//
//  LoginView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = LoginViewModel()
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthYear: Int = 2025
    @State private var errorMessage: String?
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Creat Account ")) {
                TextField("UserName",text: $username)
                
                TextField("Email",text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password",text: $password)
                
                TextField("Your year of birth", value: $birthYear, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            
            Button("Sign Up") {
                if viewModel.isValidEmail(email) && viewModel.isYourYearOfBirthValid(birthYear) {
                    viewModel.saveUserData(username, email, password, birthYear)
                    isLoggedIn = true
                    errorMessage = nil
                    dismiss()
                } else {
                    errorMessage = "Invalid email format".uppercased()
                }
            }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
