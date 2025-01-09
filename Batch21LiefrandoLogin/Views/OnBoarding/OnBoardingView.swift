//
//  OnBoardingView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            TabView{
                OnBoarding_WelcomeToSyntando()
                OnBoarding_Questions()
                OnBoarding_NotificationRequest()
                Button("LogOut"){
                    AuthManager.shared.logOut()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

#Preview {
    OnBoardingView()
}
