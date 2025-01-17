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
        VStack{
            if(authManager.appUser?.hasOnBoarded ?? false){
                Text("Hallo \(authManager.appUser?.firstName ?? "XY") das hier wird die HauptView")
                if(authManager.appUser?.type == .customer){
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .foregroundStyle(.orange)
                        .padding(.horizontal,8)
                }else{
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .foregroundStyle(.orange)
                        .padding(.horizontal,8)
                }
                SyntandoButton(text: "Logout", active: true) {
                    authManager.logOut()
                }
            }else {
                OnBoardingView()
            }
        }
    }
}

#Preview {
    HomeView()
}
