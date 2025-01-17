//
//  CustomerQuestionView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 19.12.24.
//

import SwiftUI

struct CustomerQuestionView: View {
    @EnvironmentObject var viewModel : OnBoardingViewModel
    var body: some View {
        VStack{
            VStack(spacing: 16){
                
                AlexTextField(text: $viewModel.firstName, placeholder: "Firstname",keyboardType: .default)
                    
                AlexTextField(text: $viewModel.lastName, placeholder: "Lastname",keyboardType: .default)
                    
                AlexTextField(text: $viewModel.number, placeholder: "Number", keyboardType: .numberPad)
                    
                AlexTextField(text: $viewModel.email, placeholder: "Email", keyboardType: .emailAddress)
                
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
