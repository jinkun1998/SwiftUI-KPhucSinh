//
//  ForgotPasswordView.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Bindable private var vm = ForgotPasswordViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Bạn quên mất mật khẩu?")
                .font(.title)
                .bold()
            
            Text("Chúng tôi sẽ gửi cho bạn bản hướng dẫn cách lấy lại mật khẩu thông qua Email bạn đã sử dụng khi đăng ký tài khoản.")
                .multilineTextAlignment(.center)
            
            TextField("Vui lòng nhập email của bạn", text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            Button {
                vm.forgotPassword()
                
                print("forgot password")
            } label: {
                KPS_Button(title: "Gửi", buttonStyle: .full, height: 50)
            }
        }
        .padding(50)
        .useStandardToolBarStyle(title: "Quên mật khẩu") {
            EmptyView()
        }
    }
}

#Preview {
    ForgotPasswordView()
}
