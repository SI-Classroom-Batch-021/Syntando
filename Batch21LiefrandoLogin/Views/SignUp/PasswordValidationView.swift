//
//  PasswordValidationView.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct PasswordValidationView: View {
    var missingCharacters : Int
    var capsCompliant : Bool
    var specialCharCompliant : Bool
    var numberCompliant : Bool

    private var lengthCompliant: Bool {
        missingCharacters == 0
    }

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                
                AnforderungsLabel(text: "label.password_min_8_characters_\(missingCharacters)", isCompliant: lengthCompliant)
                AnforderungsLabel(text: "label.password_capital_letter", isCompliant: capsCompliant)
            }
            Spacer()
            VStack(alignment: .leading){
                AnforderungsLabel(text: "label.password_special_character", isCompliant: specialCharCompliant)
                AnforderungsLabel(text: "label.password_number", isCompliant: numberCompliant)
            }
            
        }
    }
}

#Preview {
    PasswordValidationView(missingCharacters: 0, capsCompliant: false, specialCharCompliant: true, numberCompliant: false)
}
