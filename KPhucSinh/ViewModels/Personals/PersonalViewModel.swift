//
//  PersonalViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 11/8/24.
//

import Foundation
import FirebaseAuth

@Observable class PersonalViewModel {
    
    var currentUserUid: String?
    
    init() {
       
    }
    
    func signOut() {
        FirebaseService.shared.signOut()
        currentUserUid = nil
    }
    
    func getCurrentUser() async throws -> UserModel? {
        guard currentUserUid != nil else {
            return nil
        }
        
        return try await FirebaseService.shared.getUser()
    }
}
