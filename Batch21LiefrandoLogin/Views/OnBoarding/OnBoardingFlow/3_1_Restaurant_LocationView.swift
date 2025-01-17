//
//  3_Restaurant_Location_View.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct Restaurant_LocationView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel
    var body: some View {
        VStack{
            Text("Location")
        }
        .onAppear {
            withAnimation {
                viewModel.onBoardingProgress = 3/7
            }
        }
    }
}

#Preview {
    Restaurant_LocationView()
}
