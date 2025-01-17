//
//  WelcomeView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 17.01.25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel
    @State var imageOffset : CGFloat = -300
    
    var body: some View {
        VStack(){
            Text("label.welcome_header")
                .font(.headline)
                .fontWeight(.heavy)
                .padding()
            Text("label.welcome_subheader")
                .font(.subheadline)
                .fontWeight(.semibold)
            HStack{
                Image(systemName: "wind")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(180))
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
                    .offset(x: imageOffset,y:0)
                    .symbolEffect(.breathe)
                    .zIndex(1)
                
                Image(systemName: "truck.box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .offset(x: imageOffset,y:0)
                    .zIndex(1)
            }
                
            
            SyntandoButton(text: "label.start_onboarding", active: true) {
                //
                withAnimation(.linear(duration: 1.5)) {
                    imageOffset = 350
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, -20)
        }
        .onAppear{
            withAnimation {
                viewModel.onBoardingProgress = 1/7
                
            }
            withAnimation(.linear(duration: 2.5)) {
                imageOffset = 0
            }

        }
       
        
    }
        
}

#Preview {
    ZStack{
        Color.orange.edgesIgnoringSafeArea(.all)
        WelcomeView()
            .environmentObject(OnBoardingViewModel())
    }
}
