//
//  LoginFlowView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 15.01.25.
//

import SwiftUI

struct LoginFlowView: View {
    @StateObject var authManager = AuthManager.shared
    @StateObject var authViewModel = AuthViewModel(authManager: AuthManager.shared)
    var body: some View {
        if(authViewModel.showRegister){
            RegisterView()
        }else{
            LogInView()
        }
    }
}

#Preview {
    LoginFlowView()
}
