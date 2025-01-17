//
//  3_Customer_Location.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct Customer_LocationView: View {
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
    Customer_LocationView()
}
