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
    var body: some View {
        VStack{
            
            VStack(spacing: 16){
                
                AlexTextField(text: $firstName, placeholder: "Firstname", isNumberField: false)
               
                AlexTextField(text: $lastName, placeholder: "Lastname", isNumberField: false)
                  
                AlexTextField(text: $mobileNumber, placeholder: "Number", isNumberField: true)
                    
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
