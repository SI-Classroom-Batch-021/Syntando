//
//  LogInView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.12.24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

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
                TextField("textfield.email",text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(8)
                    .padding(.horizontal,16)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                //Password
                PasswordField(desc: "textfield.password", password: $viewModel.password)
                    .padding(.horizontal,16)
                    .offset(x: shakePasswordField ? -10 : 0)
                  
                // Error Message
                if(viewModel.errorMessage != ""){
                    Text("label.error_login")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                //signUp Button
                
                SyntandoButton(text: "button.login", active: viewModel.readyToLogin, action: {
                    Task{
                        await viewModel.loginUser()
                    }
                })
                .padding(.horizontal,16)
                .padding(.top,40)
                .disabled(!viewModel.readyToLogin)
                
                HStack{
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .offset(y: 2)
                        .padding(.leading,8)
                    Text("label.or")
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .offset(y: 2)
                        .padding(.trailing,8)
                }
                
                Button(action : {
                    Task{
                        await viewModel.signinWithGoogle()
                    }
                }){
                    ZStack{
                        Text("button.signin_with_google")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundStyle(Color.black)
                            .cornerRadius(8)
                        HStack{
                            Image("Google")
                                .padding()
                            Spacer()
                            
                        }
                    }
                    .padding()
                    
                }
                Spacer()
                
                //Link to Log in
                HStack{
                    Text("label.new_account")
                        .foregroundStyle(.gray)
                    Button(action: {
                        print("swap to Login Pressed")
                        viewModel.showRegister = true
                    }){
                        Text("button.register")
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
