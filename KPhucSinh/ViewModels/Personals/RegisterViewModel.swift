//
//  RegisterViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation

@Observable class RegisterViewModel {
    var fullName: String = ""
    var phone: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var isAgreeTermAndCondition: Bool = false
    var error: String = ""
    var isShowLoadingView: Bool = false
    
    func validate() -> Bool {
        guard !fullName.isEmpty
                || !phone.isEmpty
                || !email.isEmpty
                || !password.isEmpty
                || !confirmPassword.isEmpty else {
            error = "Vui lòng nhập đầy đủ thông tin."
            return false
        }
        
        return true
    }
    
    func register() async throws -> UserModel?  {
        
        guard validate() else { return nil }
        
        let user = UserModel(
            fullName: fullName,
            phone: phone,
            email: email,
            avatar: Consts.avatar,
            isReceivePromotion: true,
            birthDate: Date.getPochTimeInterval(),
            gender: 0,
            city: 0,
            district: 0,
            ward: 0,
            address: "",
            createdDate: Date().timeIntervalSince1970
        )
        
        try await FirebaseService.shared.register(email: email, password: password, data: user)
        
        return user
    }
}
