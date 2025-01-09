//
//  OnBoarding_WelcomeToSyntando.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI
// Alex will TON
struct OnBoarding_WelcomeToSyntando: View {
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            VStack{
                Text("label.syntando")
                    .font(.largeTitle)
                Text("label.delivery_slogan")
                    .font(.caption)
                Image(systemName: "truck.box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .padding(.bottom,40)
            }
        }
    }
}

#Preview {
    OnBoarding_WelcomeToSyntando()
}
