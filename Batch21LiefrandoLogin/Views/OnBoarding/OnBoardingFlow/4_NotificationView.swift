//
//  4_NotificationView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel

    var body: some View {
        VStack{
            Text("notification")
        }
        .onAppear {
            withAnimation {
                viewModel.onBoardingProgress = 5/7
            }
        }
    }
}

#Preview {
    NotificationView()
}
