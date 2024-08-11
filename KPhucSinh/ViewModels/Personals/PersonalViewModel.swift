//
//  PersonalViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 11/8/24.
//

import Foundation

@Observable class PersonalViewModel {
    
    var currentUserUid: String?
    
    init() {
        FirebaseService.shared.$currentUserUid.sink { [weak self] currentUserUid in
            self?.currentUserUid = currentUserUid
        }
    }
    
    func signOut() {
        FirebaseService.shared.signOut()
        currentUserUid = nil
    }
}
