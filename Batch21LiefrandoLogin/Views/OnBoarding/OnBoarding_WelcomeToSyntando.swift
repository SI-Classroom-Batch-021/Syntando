//
//  OnBoarding_WelcomeToSyntando.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI
// Alex will TON
struct OnBoarding_WelcomeToSyntando: View {
    @State var rotation : Angle = .zero
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            VStack{
                Text("Syntando")
                    .font(.largeTitle)
                Text("Hier bist du geliefert!")
                    .font(.caption)
                Image(systemName: "truck.box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .padding(.bottom,40)
                    .rotationEffect(rotation)
                    .gesture(
                        RotateGesture()
                            .onChanged({ value in
                                rotation = value.rotation
                            })
                    )
            }
        }
    }
}

#Preview {
    OnBoarding_WelcomeToSyntando()
}
