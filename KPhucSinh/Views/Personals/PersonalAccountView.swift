//
//  PersonalAccountView.swift
//  KPhucSinh
//
//  Created by Jin on 31/7/24.
//

import SwiftUI

struct PersonalAccountView: View {
    
    @EnvironmentObject var appData: AppDataEnvironmentViewModel
    
    @Bindable var vm = PersonalAccountViewModel()
    
    @State private var selection: Int = 0
    private let itemHeight: CGFloat = 40
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                // THÔNG TIN TÀI KHOẢN
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
                            isChecked: $vm.isReceivePromotion
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
                
                // THÔNG TIN CÁ NHÂN
                Section {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            KPS_MaterialTextField(placeHolder: "Họ tên", text: $vm.fullName)
                            KPS_MaterialTextField(placeHolder: "Số điện thoại", keyboardType: .numberPad, text: $vm.phone)
                        }
                        .frame(height: itemHeight)
                        
                        KPS_MaterialTextField(placeHolder: "Email", keyboardType: .emailAddress, text: $vm.email)
                            .frame(height: itemHeight)
                        
                        HStack {
                            Text("Ngày sinh")
                                .font(.callout)
                            
                            TextField("", text: $vm.dayOfBirth)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight)
                            Text("/")
                                .font(.callout)
                            TextField("", text: $vm.monthOfBirth)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight)
                            Text("/")
                                .font(.callout)
                            TextField("", text: $vm.yearOfBirth)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: itemHeight * 2)
                            
                            Spacer()
                        }
                        .frame(height: itemHeight)
                        
                        HStack {
                            Text("Giới tính")
                                .font(.callout)
                            
                            KPS_CheckboxGroupView(axis: .horizontal, type: .capsule, values: $vm.genders)
                                .frame(height: itemHeight)
                        }
                        
                        KPS_MaterialTextField(placeHolder: "Địa chỉ", text: $vm.address)
                        
                        HStack {
                            KPS_DropdownBox(placeholder: "Tỉnh/Thành", items: vm.cities, selectedItem: $vm.city)
                               
                            KPS_DropdownBox(placeholder: "Quận/Huyện", items: vm.districts, selectedItem: $vm.district)
                                .disabled(vm.city == nil)
                        }
                        .frame(height: itemHeight + 20)
                        
                        KPS_DropdownBox(placeholder: "Phường/Xã", items: vm.wards, selectedItem: $vm.ward)
                            .frame(height: itemHeight + 40)
                            .disabled(vm.district == nil)
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
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
            
            Button {
                print("saved")
                
                Task {
                    try await vm.updateCurrentUser()
                }
                
            } label: {
                KPS_Button(title: "Lưu thông tin", buttonStyle: .full)
            }
        }
        .scrollIndicators(.hidden)
        .padding()
        .useStandardToolBarStyle(title: "Tài khoản") {
            EmptyView()
        }
        .onAppear() {
            Task {
                try await vm.fetchData()
            }
        }
        .onChange(of: vm.city) {
            vm.district = nil
            if (vm.city != nil) {
                Task {
                    try await vm.getDistricts(provinceId: vm.city!.originalId)
                }
            }
        }
        .onChange(of: vm.district) {
            vm.ward = nil
            if (vm.district != nil) {
                Task {
                    try await vm.getWards(districtId: vm.district!.originalId)
                }
            }
        }
    }
}

#Preview {
    PersonalAccountView()
        .environmentObject(AppDataEnvironmentViewModel())
}
