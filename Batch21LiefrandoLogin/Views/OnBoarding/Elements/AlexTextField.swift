//
//  AlexTextField.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 19.12.24.
//

import SwiftUI

struct AlexTextField: View {
    @Binding var text : String
    let placeholder: String
    let isNumberField : Bool
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero
    
    var body: some View {
        
            
            TextField(placeholder, text: $text)
                .keyboardType( isNumberField ? .numberPad : .default)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .trim(from: 0.0, to: 0.545)
                            .stroke(.black, lineWidth: 1)
                        RoundedRectangle(cornerRadius: 8)
                            .trim(from: 0.560 + (0.44 * (labelWidth / width)), to: 1)
                            .stroke(.black, lineWidth: 1)
                        Text(placeholder)
                            .foregroundColor(.black)
                            .overlay( GeometryReader { geo in Color.clear.onAppear { labelWidth = geo.size.width }})
                            .padding(2)
                            .font(.caption)
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity,
                                   alignment: .topLeading)
                            .offset(x: 20, y: -10)
                        
                    }
                }
                .overlay( GeometryReader { geo in Color.clear.onAppear { width = geo.size.width }})
                .onChange(of: width) { _, _ in
                    print("Width: ", width)
                }
                .onChange(of: labelWidth) { _, _ in
                    print("labelWidth: ", labelWidth)
                }
            
        }
    }
    

#Preview {
    ZStack{
        Color.orange
        AlexTextField(text: .constant("Alexander"), placeholder: "Vorname", isNumberField: false)
    }
}
