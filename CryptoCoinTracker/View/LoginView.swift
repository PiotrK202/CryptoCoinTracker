//
//  LoginView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthYear = ""
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
                
                TextField("Your Year Of Birth",text: $birthYear)
                    .keyboardType(.numberPad)
                if let error = errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            Button("Sign Up") {
                if isValidEmail(email) {
                    KeychainHelper.shared.save(token: username, forKey: "userName")
                    KeychainHelper.shared.save(token: email, forKey: "userEmail")
                    KeychainHelper.shared.save(token: password, forKey: "userPassword")
                    KeychainHelper.shared.save(token: birthYear, forKey: "userBirthYear")
                    isLoggedIn = true
                    errorMessage = nil
                    dismiss()
                } else {
                    errorMessage = "Invalid email format".uppercased()
                }
            }
            
        }
    }
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
