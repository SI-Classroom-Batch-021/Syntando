//
//  5_ConfirmationView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel

    var body: some View {
        VStack{
            Text("confirmation")
            SyntandoButton(text: "test", active: true) {
                withAnimation {
                    viewModel.onBoardingProgress = 7/7
                }
            }
        }
        .onAppear {
            withAnimation {
                viewModel.onBoardingProgress = 6/7
            }
        }
    }
}

#Preview {
    ConfirmationView()
}
