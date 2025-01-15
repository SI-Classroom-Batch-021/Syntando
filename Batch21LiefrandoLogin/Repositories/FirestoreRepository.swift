//
//  FirestoreRepository.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 15.01.25.
//

import Foundation
import FirebaseFirestore

class FirestoreRepository{
    let db = Firestore.firestore()
    
    func createUser(user : AppUser){
        do{
            try db.collection(DocumentPath.user.rawValue).document(user.id).setData(from : user)
        }catch{
            print("ERROR SAVING USER: \(error.localizedDescription)")
        }
    }
    
    func loadUser(id : String) async throws -> AppUser{
        do{
            let result = try await db.collection(DocumentPath.user.rawValue).document(id).getDocument()
            
            return try result.data(as : AppUser.self)
        }catch{
            print("ERROR GETTING USER")
            throw error
        }
        
    }
    
    
}
