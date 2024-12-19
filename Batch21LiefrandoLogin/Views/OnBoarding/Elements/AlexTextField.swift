//
//  AlexTextField.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 19.12.24.
//

import SwiftUI

struct AlexTextField: View {
    @Binding var text : String
    var desc : String
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextField("",text: $text)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
            Text(desc)
                .font(.footnote)
                .foregroundStyle(.white)
                .fontWeight(.light)
                .padding(.horizontal,4)
                .background(Color.gray)
                .clipShape(Capsule())
                .offset(x: 8 ,y: -20)
        }
    }
}

#Preview {
    ZStack{
        Color.orange
        AlexTextField(text: .constant("test"), desc: "test")
    }
}
