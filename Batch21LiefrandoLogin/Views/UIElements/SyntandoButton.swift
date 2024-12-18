//
//  SynlandoButton.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 18.12.24.
//

import SwiftUI

struct SyntandoButton: View {
    var text: String
    var active: Bool
    var action : () -> Void
    var body: some View {
        Button(action: {
            action()
        }){
            Text(text)
                .frame(maxWidth: .infinity)
                .padding()
                .background(active ? Color.white : Color.white.opacity(0.7))
                .foregroundColor(Color.orange)
                .cornerRadius(8)
                
        }
    }
}

#Preview {
    ZStack{
        Color.orange
        SyntandoButton(text: "Login",active: true,action: {
            print("Hallo")
        })
    }
}
