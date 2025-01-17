//
//  OnBoarding_doneView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.01.25.
//

import SwiftUI

struct OnBoarding_doneView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                Text("label.onboarding_done")
                SyntandoButton(text: "button.onBoarding_save", active: true) {
                    viewModel.saveOnboardingData()
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoarding_doneView()
}
