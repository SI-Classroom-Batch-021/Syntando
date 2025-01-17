//
//  3_Resturant_Data_View.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct Resturant_DataView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel

    var body: some View {
        VStack{
            Text("Data")
        }
        .onAppear {
            withAnimation {
                viewModel.onBoardingProgress = 4/7
            }
        }
    }
}

#Preview {
    Resturant_DataView()
}
