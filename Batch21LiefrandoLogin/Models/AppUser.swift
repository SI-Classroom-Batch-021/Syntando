//
//  AppUser.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 15.01.25.
//

import Foundation
import Firebase
struct AppUser : Codable{
    var id : String
    var email : String
    var firstName : String
    var lastName: String
    var birthday : String
    var number : String
    var registerdOn: String
    var type : String
    var hasOnBoarded: Bool
    
}
