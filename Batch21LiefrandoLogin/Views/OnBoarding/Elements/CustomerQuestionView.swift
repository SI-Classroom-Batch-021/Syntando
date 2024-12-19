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
            
            HStack{
                AlexTextField(text: $firstName, desc: "Firstname")
                    .padding(.horizontal,16)
                AlexTextField(text: $lastName, desc: "Lastname")
                    .padding(.horizontal,16)

            }
            AlexTextField(text: $mobileNumber, desc: "Number")
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
