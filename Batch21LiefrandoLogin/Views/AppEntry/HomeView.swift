//
//  HomeView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 15.01.25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var authManager = AuthManager.shared
    @StateObject var authViewModel = AuthViewModel(authManager: AuthManager.shared)
    
    var body: some View {
        if(authManager.appUser?.hasOnBoarded ?? false){
            Text("Hallo das hier wird die HauptView")
        }else {
            OnBoardingView()
        }
    }
}

#Preview {
    HomeView()
}
