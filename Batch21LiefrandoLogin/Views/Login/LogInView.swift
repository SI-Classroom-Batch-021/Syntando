//
//  LogInView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.12.24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var shakePasswordField: Bool = false
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            VStack(){
                Spacer()
                //Logo
                Image(systemName: "bag.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .padding(.bottom,40)
                //Email
                TextField("Email",text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(8)
                    .padding(.horizontal,16)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                //Password
                PasswordField(desc: "Choose Password", password: $viewModel.password)
                    .padding(.horizontal,16)
                    .offset(x: shakePasswordField ? -10 : 0)
                  
                // Error Message
                if(viewModel.errorMessage != ""){
                    Text("Fehler beim Einloggen")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                //signUp Button
                
                SyntandoButton(text: "Login", active: viewModel.readyToLogin, action: {
                    Task{
                        await viewModel.loginUser()
                    }
                })
                .padding(.horizontal,16)
                .padding(.top,40)
                .disabled(!viewModel.readyToLogin)
                Spacer()
                
                //Link to Log in
                HStack{
                    Text("New to us ? Create an Account? ")
                        .foregroundStyle(.gray)
                    Button(action: {
                        print("swap to Login Pressed")
                        viewModel.showRegister = true
                    }){
                        Text("Register")
                            .foregroundStyle(.white)
                    }
                }
                .padding()
            }
        }
        .onChange(of: viewModel.password) { _,_ in
            viewModel.checkPasswordForCompliance()
        }
        .onChange(of: viewModel.email) { _,_ in
            viewModel.checkEmailForCompliance()
        }
        
            }
}

#Preview {
    LogInView()
        .environmentObject(AuthViewModel(authManager: AuthManager.shared))

}
