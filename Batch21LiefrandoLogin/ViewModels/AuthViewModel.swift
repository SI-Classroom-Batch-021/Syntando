//
//  SignUpViewModel.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import Foundation

@MainActor
class AuthViewModel : ObservableObject {
    
    @Published var showRegister : Bool = false
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    @Published var errorMessage : String = ""
    
    @Published var emailCompliant : Bool = false
    @Published var capsCompliant : Bool = false
    @Published var numberCompliant : Bool = false
    @Published var missingPasswordCharacters : Int = 8
    @Published var specialCharCompliant : Bool = false
    
    private var authManager : AuthManager
    
    init(authManager : AuthManager){
        self.authManager = authManager
    }
    
    var passwordIsCompliant : Bool {
        capsCompliant && numberCompliant && missingPasswordCharacters == 0 && specialCharCompliant
    }
    var passwordsAreEqual : Bool {
        password == confirmPassword && password != ""
    }
    var readyToLogin : Bool{
        if(self.showRegister){
            return passwordIsCompliant && passwordsAreEqual && emailCompliant
        }else {
            return email != "" && password != ""
        }
    }
    
    func checkPasswordForCompliance() {
        capsCompliant = false
        numberCompliant = false
        specialCharCompliant = false
        
        missingPasswordCharacters = max(8 - password.count, 0)

        for char in password{
            if char.isUppercase { capsCompliant = true }
            if char.isNumber { numberCompliant = true }
            if "!?&$%*-".contains(char) {specialCharCompliant = true}
        }
    }
    
    func checkEmailForCompliance(){
        let validMailRegex: String = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        
        emailCompliant = NSPredicate(format: "SELF MATCHES %@", validMailRegex).evaluate(with: email)
        }
    
    func registerUser() async{
         await authManager.register(email: email, password: password)
        
    }
    func loginUser() async{
         await authManager.login(email: email, password: password)
    }
}
