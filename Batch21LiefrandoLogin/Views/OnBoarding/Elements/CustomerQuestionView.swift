//
//  CustomerQuestionView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 19.12.24.
//

import SwiftUI

struct CustomerQuestionView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var mobileNumber : String = ""
    @State var email: String = ""
    var body: some View {
        VStack{
            
            VStack(spacing: 16){
                
                AlexTextField(text: $firstName, placeholder: "Firstname",keyboardType: .default)
               
                AlexTextField(text: $lastName, placeholder: "Lastname",keyboardType: .default)
                  
                AlexTextField(text: $mobileNumber, placeholder: "Number", keyboardType: .numberPad)
                
                AlexTextField(text: $email, placeholder: "Email", keyboardType: .emailAddress)
                
                    
            }
            .padding(16)
        }
    }
}

#Preview {
    ZStack{
        Color.orange.ignoresSafeArea()
        CustomerQuestionView()
    }
}
