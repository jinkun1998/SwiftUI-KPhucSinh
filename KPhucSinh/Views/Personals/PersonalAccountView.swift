//
//  PersonalAccountView.swift
//  KPhucSinh
//
//  Created by Jin on 31/7/24.
//

import SwiftUI

struct PersonalAccountView: View {
    
    @State private var selection: Int = 0
    private let itemHeight: CGFloat = 40
    @State private var isReceivePromotion: Bool = true
    @State private var fullName: String = "Quốc Thảo"
    @State private var genders: [CheckboxModel] = [
        CheckboxModel(id: 1, title: "Nam", isChecked: true),
        CheckboxModel(id: 2, title: "Nữ", isChecked: false),
        CheckboxModel(id: 3, title: "Khác", isChecked: false)
    ]
    
    var body: some View {
        ScrollView {
            /// THÔNG TIN TÀI KHOẢN
            VStack(alignment: .leading, spacing: 10) {
                Section {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Ảnh đại diện")
                                .font(.callout)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .frame(height: itemHeight)
                        
                        HStack {
                            Text("Mã QR của tôi")
                                .font(.callout)
                            
                            Spacer()
                            
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .scaledToFit()
                            Image(systemName: "chevron.right")
                        }
                        .frame(height: itemHeight)
                        
                        HStack {
                            Text("Đổi mật khẩu")
                                .font(.callout)
                            
                            Spacer()
                            
                            Image(systemName: "key.viewfinder")
                                .resizable()
                                .scaledToFit()
                            Image(systemName: "chevron.right")
                        }
                        .frame(height: itemHeight)
                        
                        KPS_CheckboxView(
                            title: "Gửi cho tôi các thông tin khuyến mãi",
                            type: .circle,
                            isChecked: $isReceivePromotion
                        )
                        .frame(height: itemHeight)
                    }
                } header: {
                    HStack {
                        Text("Thông tin tài khoản")
                            .foregroundColor(.white)
                            .bold()
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Consts.primaryColor)
                            }
                        
                        Spacer()
                    }
                }
                
                /// THÔNG TIN CÁ NHÂN
                Section {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            KPS_MaterialTextField(placeHolder: "Họ tên", text: $fullName)
                            KPS_MaterialTextField(placeHolder: "Số điện thoại", text: $fullName)
                        }
                        .frame(height: itemHeight)
                        
                        KPS_MaterialTextField(placeHolder: "Số điện thoại", text: $fullName)
                        .frame(height: itemHeight)
                        
                        HStack {
                            Text("Ngày sinh")
                                .font(.callout)
                            
                            TextField("", text: .constant("23"))
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight)
                            Text("/")
                                .font(.callout)
                            TextField("", text: .constant("06"))
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight)
                            Text("/")
                                .font(.callout)
                            TextField("", text: .constant("1998"))
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight * 2)
                            
                            Spacer()
                        }
                        .frame(height: itemHeight)
                        
                        HStack {
                            Text("Giới tính")
                                .font(.callout)
                            
                            KPS_CheckboxGroupView(axis: .horizontal, type: .capsule, values: $genders)
                                .frame(height: itemHeight)
                        }
                        
                        KPS_MaterialTextField(placeHolder: "Địa chỉ", text: $fullName)
                        
                        HStack {
                            Picker(selection: $selection, content: {
                                Text("1").tag(0)
                                Text("2").tag(1)
                                Text("3").tag(2)
                            }, label: {
                                Text("Tỉnh/Thành")
                            })
                            .pickerStyle(.menu)
                        }
                    }
                } header: {
                    HStack {
                        Text("Thông tin cá nhân")
                            .foregroundColor(.white)
                            .bold()
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Consts.primaryColor)
                            }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            .useStandardToolBarStyle(title: "Tài khoản") {
                EmptyView()
            }
        }
    }
}

#Preview {
    PersonalAccountView()
}
