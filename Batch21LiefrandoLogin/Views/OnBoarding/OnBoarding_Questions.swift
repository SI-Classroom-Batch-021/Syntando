//
//  OnBoarding_Questions.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 19.12.24.
//

import SwiftUI

struct OnBoarding_Questions: View {
    @State var isRestuarant : Bool = false
    @State var isCustomer : Bool = false
    var body: some View {
        ZStack{
            Color.orange
            //Auswhal ob Restaurant oder Besteller
            VStack{
                DecisionView()
                CustomerQuestionView()
            }
            
            
            
        }.ignoresSafeArea()
    }
}

#Preview {
    OnBoarding_Questions()
}
