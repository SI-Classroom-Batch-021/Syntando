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
import SwiftUI


@MainActor
class AuthManager: ObservableObject{
    
    static let shared = AuthManager()
    var repository = FirestoreRepository()

    @Published var user: User?
    @Published var appUser: AppUser?
    @Published var errorMessage: String?
    @Published var authState : AuthState = .notLoggedIn
    
    private var fireBaseAuthManager = Auth.auth()
    
    private init(){
        self.user = fireBaseAuthManager.currentUser
        
        if user != nil{
            setAuthStateLoading()
            Task {
                self.appUser = try await repository.loadUser(id: user!.uid)
                setAuthStateLoggedIn()
            }
        }
        
    }
   
    
    
    func register(email: String,password: String) async{
        do{
            setAuthStateLoading()
            let result =  try await fireBaseAuthManager.createUser(withEmail: email, password: password)
            self.user = result.user
            
            var localAppUser = AppUser(id: result.user.uid,
                                  email: result.user.email ?? "",
                                  firstName: "",
                                  lastName: "",
                                  birthday: "",
                                  number: "",
                                  registerdOn: Date.now.ISO8601Format(),
                                  type: "",
                                  hasOnBoarded: false)
            
            repository.createUser(user: localAppUser)
            self.appUser = localAppUser
            
            setAuthStateLoggedIn()
        }catch{
            self.errorMessage = error.localizedDescription
        }
        
    }
    
    func login(email : String, password : String) async {
        do{
            setAuthStateLoading()
            let result = try await fireBaseAuthManager.signIn(withEmail: email, password: password)
            self.user = result.user
            self.appUser = try await repository.loadUser(id: result.user.uid)
            setAuthStateLoggedIn()
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    func logOut(){
        do{
            try fireBaseAuthManager.signOut()
            self.user = nil
            self.appUser = nil
            setAuthStateNotLoggedIn()

        }catch{
            errorMessage = error.localizedDescription
        }
    }
    
    func signInWithGoogle() async -> Bool{
        
        setAuthStateLoading()
        
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
            
            var localAppUser = AppUser(id: result.user.uid,
                                       email: result.user.email ?? "",
                                  firstName: "",
                                  lastName: "",
                                  birthday: "",
                                  number: "",
                                  registerdOn: Date.now.ISO8601Format(),
                                  type: "",
                                  hasOnBoarded: false)
            
            repository.createUser(user: localAppUser)
            self.appUser = try await repository.loadUser(id: result.user.uid)
            setAuthStateLoggedIn()
            
            return true
        }
        catch{
            print(error.localizedDescription)
            return false
        }
        
    }
    
    func setAuthStateLoading(){
        self.authState = .loading
    }
    func setAuthStateNotLoggedIn(){
        self.authState = .notLoggedIn
    }
    func setAuthStateLoggedIn(){
        self.authState = .loggedIn
    }
    
}
