//
//  AuthManager.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.12.24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthManager: ObservableObject{
    
    static let shared = AuthManager()
    
    @Published var user: User?
    @Published var errorMessage: String?
    
    
    private var fireBaseAuthManager = Auth.auth()
    
    private init(){
        self.user = fireBaseAuthManager.currentUser
    }
    
  
    
    func register(email: String,password: String) async{
        do{
            let result =  try await fireBaseAuthManager.createUser(withEmail: email, password: password)
            self.user = result.user
        }catch{
            self.errorMessage = error.localizedDescription
        }
        
    }
    
    func login(email : String, password : String) async {
        do{
            let result = try await fireBaseAuthManager.signIn(withEmail: email, password: password)
            self.user = result.user
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    func logOut(){
        do{
            try fireBaseAuthManager.signOut()
            self.user = nil
        }catch{
            errorMessage = error.localizedDescription
        }
    }
    
    
}
