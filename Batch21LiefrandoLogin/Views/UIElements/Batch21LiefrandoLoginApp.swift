//
//  Batch21LiefrandoLoginApp.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 13.12.24.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct Batch21LiefrandoLoginApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
