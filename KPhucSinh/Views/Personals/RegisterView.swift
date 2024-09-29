//
//  RegisterView.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var appData: AppDataEnvironmentViewModel
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @Bindable private var vm = RegisterViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("ĐĂNG NHẬP TÀI KHOẢN")
                    .bold()
                
                KPS_IconTextField(placeHolder: "Họ tên", systenImage: "person.fill", text: $vm.fullName)
                
                KPS_IconTextField(placeHolder: "Số điện thoại", systenImage: "phone.fill", text: $vm.phone)
                
                KPS_IconTextField(placeHolder: "Email", systenImage: "envelope.fill", text: $vm.email)
                
                KPS_IconTextField(placeHolder: "Nhập mật khẩu", systenImage: "lock.fill", isSecureField: true, text: $vm.password)
                
                KPS_IconTextField(placeHolder: "Nhập lại mật khẩu", systenImage: "lock.rotation.open", isSecureField: true,  text: $vm.confirmPassword)
                
                HStack {
                    KPS_CheckboxView(title: "", type: .circle, isChecked: $vm.isAgreeTermAndCondition)
                    
                    NavigationLink(value: "") {
                        HStack {
                            
                            Text("\(Text("Tôi đồng ý với").foregroundStyle(.gray)) \(Text("điều khoản bảo mật và sử dụng").foregroundStyle(Consts.primaryColor))")
                                .multilineTextAlignment(.leading)
                        }
                    }
                    
                    Spacer()
                }
                
                Button {
                    Task {
                        withAnimation {
                            vm.isShowLoadingView = true
                        }
                        
                        let userData = try await vm.register()
                        if (userData != nil) {
                            appData.setUser(user: userData!)
                            appData.popToRoot()
                        }
                        
                        withAnimation {
                            vm.isShowLoadingView = false
                        }
                    }
                    
                    print("sign up")
                } label: {
                    KPS_Button(title: "ĐĂNG KÝ", buttonStyle: .full, height: 50)
                }
                .disabled(!vm.isAgreeTermAndCondition)
                
                HStack {
                    Text("Đã có tài khoản?")
                    
                    Spacer()
                    
                    Button {
                        dismiss.callAsFunction()
                        
                        print("dismiss")
                    } label: {
                        Text("ĐĂNG NHẬP")
                    }
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
            
            if (vm.isShowLoadingView) {
                KPS_LoadingView()
            }
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(AppDataEnvironmentViewModel())
}
