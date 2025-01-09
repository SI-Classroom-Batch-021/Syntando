//
//  AuthManager.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.12.24.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
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
    
    func signInWithGoogle() async -> Bool{
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Client ID found in Firebase Config")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first, let rootViewController = window.rootViewController else {
            
            print("there is no root view controller")
            return false
        }
            
        do{
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                print("ID token missing")
                return false
            }
            let accessToken = user.accessToken
            
            let credentials = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            let result = try await fireBaseAuthManager.signIn(with: credentials)
            self.user = result.user
            return true
        }
        catch{
            print(error.localizedDescription)
            return false
        }
        
    }
    
    
}
