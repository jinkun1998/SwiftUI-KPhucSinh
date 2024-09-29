//
//  LoginViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation
import FirebaseAuth

@Observable class LoginViewModel {
    var email: String = "quocthao23061998.tg@gmail.com"
    var password: String = "123456"
    var error: String = ""
    var isShowLoadingView: Bool = false
    
    func validate() -> Bool {
        guard !email.isEmpty else {
            error = "Email không được để trống."
            return false
        }
        
        guard !password.isEmpty else {
            error = "Mật khẩu không được để trống."
            return false
        }
        
        return true
    }
    
    func login() async throws -> UserModel? {
        
        guard validate() else {
            return nil
        }
        
        try await FirebaseService.shared.login(email: email, password: password)
        
        guard FirebaseService.shared.currentUserUid != nil else {
            error = "Tài khoản không tồn tại."
            return nil
        }
        
        return try await FirebaseService.shared.getUser()
    }
}
