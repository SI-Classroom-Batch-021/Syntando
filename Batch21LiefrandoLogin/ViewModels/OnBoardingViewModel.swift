//
//  OnBoardingViewModel.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 16.01.25.
//

import Foundation

@MainActor
class OnBoardingViewModel: ObservableObject{
    
    @Published var onBoardingProgress = 0.0
   
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var number : String = ""
    @Published var email: String = ""
    @Published var userType: UserType = .none
    
    
    var authManager = AuthManager.shared
    var repository = FirestoreRepository()
    
    func saveOnboardingData(){
        var localUser = AppUser(id: authManager.appUser?.id ?? "",
                                email: authManager.appUser?.email ?? "",
                                firstName: firstName,
                                lastName: lastName,
                                birthday: "",
                                number: number,
                                registerdOn: authManager.appUser?.registerdOn ?? "",
                                type: userType,
                                hasOnBoarded: true)
        do{
            try repository.updateUser(user: localUser)
            Task{
                authManager.appUser = try await repository.loadUser(id: localUser.id)
            }
        }catch{
            print(error)
        }
        
    }
}
