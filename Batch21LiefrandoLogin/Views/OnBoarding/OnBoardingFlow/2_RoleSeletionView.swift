//
//  RoleSeletionView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct RoleSeletionView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel
    var body: some View {
        VStack{
            Text("Role")
        }
        .onAppear {
            withAnimation {
                viewModel.onBoardingProgress = 2/7
            }
        }
    }
    
}

#Preview {
    RoleSeletionView()
}
