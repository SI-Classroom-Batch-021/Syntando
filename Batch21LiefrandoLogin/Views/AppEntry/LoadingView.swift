//
//  LoadingView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 15.01.25.
//

import SwiftUI

struct LoadingView: View {
    @State var imageOffset = -150.0
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                HStack{
                    Image(systemName: "wind")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                        .offset(x: imageOffset,y:0)
                        .symbolEffect(.breathe)
                        .zIndex(99)
                    
                    Image(systemName: "truck.box")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                        .offset(x: imageOffset,y:0)
                        .zIndex(99)
                }
                Text("label.loading_data")
                    .fontWeight(.light)
                    

            }
           
        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 2.5)) {
                imageOffset = 250
            }
            
        }
    }
}

#Preview {
    LoadingView()
}
