//
//  AnfoerderungsLabel.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI

struct AnforderungsLabel: View {
    var text: String
    var isCompliant: Bool
    var body: some View {
        
        if(isCompliant){
            HStack{
                Image(systemName: "checkmark")
                Text(text)
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            
        }else{
            HStack{
                Image(systemName: "exclamationmark.triangle.fill")
                Text(text)
            }
            .font(.footnote)
            .foregroundStyle(.white)
            
        }
        
       
    }
}

#Preview {
    ZStack{
        Color.orange
        AnforderungsLabel(text: "Test", isCompliant: false)
    }
}
