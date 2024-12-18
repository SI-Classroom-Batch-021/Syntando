//
//  PasswordValidationView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct PasswordValidationView: View {
    var lengthCompliant : Bool
    var capsCompliant : Bool
    var specialCharCompliant : Bool
    var numberCompliant : Bool
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                
                AnforderungsLabel(text: "> 8 Zeichen", isCompliant: lengthCompliant)
                AnforderungsLabel(text: "Großbuchstabe", isCompliant: capsCompliant)
            }
            Spacer()
            VStack(alignment: .leading){
                AnforderungsLabel(text: "Sonderzeichen (!?&$%*-)", isCompliant: specialCharCompliant)
                AnforderungsLabel(text: "Zahlen", isCompliant: numberCompliant)
            }
            
        }
    }
}

#Preview {
    PasswordValidationView(lengthCompliant: true, capsCompliant: false, specialCharCompliant: true, numberCompliant: false)
}
