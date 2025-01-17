//
//  OnBoardingView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject private var viewModel = OnBoardingViewModel()
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            VStack{
                ProgressView(value: viewModel.onBoardingProgress)
                    .progressViewStyle(.linear)
                    .padding(16)
                TabView{
                    WelcomeView()
                    RoleSeletionView()
                    if(viewModel.userType == .customer){
                        Customer_LocationView()
                        Customer_DataView()
                    }else{
                        Restaurant_LocationView()
                        Resturant_DataView()
                    }
                    NotificationView()
                    ConfirmationView()
                }
                .tabViewStyle(PageTabViewStyle())
                .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
