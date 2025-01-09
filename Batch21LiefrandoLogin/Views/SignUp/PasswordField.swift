//
//  PasswordField.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct PasswordField: View {
    var desc: LocalizedStringKey
    @Binding var password: String
    @State var isSecured : Bool = true
    
    var body: some View {
        
        ZStack(alignment: .trailing){
                if isSecured{
                    SecureField(desc, text: $password)
                        .frame(height: 20)
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textContentType(nil)
                }else {
                    TextField(desc, text: $password)
                        .frame(height: 20)
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                }
            Button {
                isSecured.toggle()
            } label: {
                Image(systemName: isSecured ? "eye.slash": "eye")
                    .foregroundStyle(.black)
                    .padding(8)
            }

        }
        
        
        
    }
}

#Preview {
    PasswordField(desc: "Passwort",password: .constant("Test"))
}
