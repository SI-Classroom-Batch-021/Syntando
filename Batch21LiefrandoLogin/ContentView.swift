//
//  ContentView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authManager = AuthManager.shared
    @StateObject var authViewModel = AuthViewModel(authManager: AuthManager.shared)
    
    var body: some View {
        VStack {
            if(authManager.user != nil){
                OnBoardingView()
            }else{
                if(authViewModel.showRegister){
                    RegisterView()
                }else{
                    LogInView()
                }
            }
        }
        .environmentObject(authViewModel)
            
    }
}

#Preview {
    ContentView()
        
}
