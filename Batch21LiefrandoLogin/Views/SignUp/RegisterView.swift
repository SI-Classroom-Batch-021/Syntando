//
//  SignUpView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct RegisterView: View {
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
                HStack(){
                    AnforderungsLabel(text: "Valid Email", isCompliant: viewModel.emailCompliant)
                        .padding(.horizontal,18)
                    Spacer()
                }
                //Password
                PasswordField(desc: "Choose Password", password: $viewModel.password)
                    .padding(.horizontal,16)
                    .offset(x: shakePasswordField ? -10 : 0)
                  

                //Password CheckList
                PasswordValidationView(
                    lengthCompliant: viewModel.lengthCompliant,
                    capsCompliant: viewModel.capsCompliant,
                    specialCharCompliant: viewModel.specialCharCompliant,
                    numberCompliant: viewModel.numberCompliant
                )
                .padding(.horizontal,18)
                //Password check
                PasswordField(
                    desc: "Repeat Password",
                    password: $viewModel.confirmPassword
                )
                    .padding(.horizontal,16)
                    .disabled(!viewModel.passwordIsCompliant)
                    .onTapGesture {
                        if(!viewModel.passwordIsCompliant){
                                shakePasswordField = true
                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                    shakePasswordField = false
                                }
                            
                        }
                    }
                HStack{
                    AnforderungsLabel(
                        text: "Valid Password",
                        isCompliant: viewModel.passwordsAreEqual
                    )
                        .padding(.horizontal,18)
                    Spacer()
                }
                // Stay signed in Button
                //signUp Button
                
                
                SyntandoButton(text: "Sign Up", active: viewModel.readyToLogin, action: {
                    Task{
                        await viewModel.registerUser()
                    }
                })
                .padding(.horizontal,16)
                .padding(.top,40)
                .disabled(!viewModel.readyToLogin)
                
                Spacer()
                
                //Link to Log in
                HStack{
                    Text("Already have an Account? ")
                        .foregroundStyle(.gray)
                    Button(action: {
                        viewModel.showRegister = false                        
                    }){
                        Text("Log in")
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
    RegisterView()
        .environmentObject(AuthViewModel(authManager: AuthManager.shared))
}
