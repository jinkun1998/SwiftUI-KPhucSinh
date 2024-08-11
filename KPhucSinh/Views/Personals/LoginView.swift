//
//  LoginView.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appData: AppDataEnvironmentViewModel
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @Bindable private var vm = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("ĐĂNG NHẬP TÀI KHOẢN")
                    .bold()
                
                KPS_IconTextField(placeHolder: "Nhập Email", systenImage: "person.fill", text: $vm.email)
                
                KPS_IconTextField(placeHolder: "Nhập mật khẩu", systenImage: "lock.fill", isSecureField: true,  text: $vm.password)
                
                HStack {
                    Spacer()
                    
                    NavigationLink(value: "ForgotPasswordView") {
                        Text("Quên mật khẩu?")
                            .underline()
                    }
                }
                
                Button {
                    Task {
                        let userData = try await vm.login()
                        if (userData != nil) {
                            appData.setUser(user: userData!)
                            appData.popToRoot()
                        }
                    }
                    
                    print("login")
                } label: {
                    KPS_Button(title: "ĐĂNG NHẬP", buttonStyle: .full, height: 50)
                }
                
                HStack {
                    Text("Không có tài khoản?")
                    
                    Spacer()
                    
                    NavigationLink(value: "RegisterView") {
                        Text("ĐĂNG KÝ")
                    }
                }
                
                Spacer()
                
                Button {
                    dismiss.callAsFunction()
                    print("dismiss")
                } label: {
                    Text("ĐĂNG NHẬP SAU")
                }
                
            }
            .frame(maxWidth: 300)
            .navigationBarBackButtonHidden()
                        
            if (!vm.error.isEmpty) {
                KPS_AlertView(title: "Thông báo", message: vm.error, cancelTitle: "Đã  hiểu", cancelAction:  {
                    withAnimation {
                        vm.error = ""
                    }
                })
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AppDataEnvironmentViewModel())
}
