//
//  OrderPaymentView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct OrderPaymentView: View {
    
    @EnvironmentObject var order: OrderEnvironmentViewModel

    private let navigationTitle: String = "Giỏ Hàng Của Bạn"
    
    @Bindable var vm = OrderPaymentViewModel()
    @State var isShowConfirmation: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Section(isExpanded: $vm.ri_isExpandReceiverInfoSection) {
                        VStack(alignment: .leading, spacing: 10) {
                            KPS_VerticalPlaceholderTextField(placeholder: "Họ tên", text: $vm.ri_fullName)
                            KPS_VerticalPlaceholderTextField(placeholder: "Số điện thoại", text: $vm.ri_phone)
                            KPS_VerticalPlaceholderTextField(placeholder: "Email", text: $vm.ri_email)
                            KPS_CheckboxView(title: "THÔNG TIN XUẤT HOÁ ĐƠN", type: .circle, isChecked: $vm.ri_isExportVAT)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        }
                    } header: {
                        HStack {
                            Text("THÔNG TIN NGƯỜI NHẬN")
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Consts.primaryColor)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        vm.ri_isExpandReceiverInfoSection.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $vm.si_isExpandShippingMethodSection) {
                        VStack(alignment: .leading) {
                            KPS_CheckboxView(title: "Nhận hàng tại K SHOP", type: .rect, isChecked: $vm.si_isReceiveAtStore)
                            
                            KPS_CheckboxView(title: "Nhận hàng tận nơi", type: .rect, isChecked: $vm.si_isShippingToCustomer)
                            
                            if (vm.si_isShippingToCustomer) {
                                HStack(alignment: .bottom) {
                                    KPS_VerticalPlaceholderTextField(placeholder: "Địa chỉ giao hàng", text: $vm.si_address)
                                        .disabled(true)
                                    
                                    NavigationLink {
                                        AddressView(selectedAddress: $vm.si_selectedAddress)
                                    } label: {
                                        KPS_Button(title: "THAY ĐỔI", height: 40)
                                    }
                                }
                            }
                            
                            KPS_VerticalPlaceholderTextField(placeholder: "Ghi chú khi giao hàng", text: $vm.si_shippingNote)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        }
                    } header: {
                        HStack {
                            Text("HÌNH THỨC NHẬN HÀNG")
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Consts.primaryColor)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        vm.si_isExpandShippingMethodSection.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $vm.pm_isExpandPaymentMethodSection) {
                        VStack(alignment: .leading) {
                            KPS_CheckboxView(title: "Thanh toán khi nhận hàng", type: .rect, isChecked: $vm.pm_isCOD)
                            
                            KPS_CheckboxView(title: "Chuyển khoản ngân hàng", type: .rect, isChecked: $vm.pm_isBankTransfer)
                            
                            KPS_CheckboxView(title: "Thẻ ATM nội địa", type: .rect, isChecked: $vm.pm_isNapas)
                            
                            KPS_CheckboxView(title: "Thẻ tín dụng/ ghi nợ (VISA, MASTER CARD,...)", type: .rect, isChecked: $vm.pm_isVisa)
                            
                            HStack {
                                KPS_CheckboxView(title: "Ví MoMo", type: .rect, isChecked: $vm.pm_isMoMo)
                                
                                KPS_ImageView(url: Consts.momo, aspectRatio: .fit)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        }
                    } header: {
                        HStack {
                            Text("HÌNH THỨC THANH TOÁN")
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Consts.primaryColor)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        vm.pm_isExpandPaymentMethodSection.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $vm.oi_isExpandOrderItemInfoSection) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(ProductModel.product.name)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                Text("1")
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 1)
                                            .frame(width: 20, height: 20)
                                    }
                                
                                Spacer()
                                
                                Text("\(ProductModel.product.unitPrice, specifier: "%.0f") VNĐ")
                                    .foregroundColor(Consts.primaryColor)
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        }
                    } header: {
                        HStack {
                            Text("THÔNG TIN ĐƠN HÀNG")
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Consts.primaryColor)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        vm.oi_isExpandOrderItemInfoSection.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $vm.os_isExpandOrderSummarySection) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Giá tiền (tạm tính)")
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("\(ProductModel.product.unitPrice, specifier: "%.0f") VNĐ")
                                    .foregroundColor(Consts.primaryColor)
                                    .bold()
                            }
                            
                            HStack {
                                Text("Tổng khối lượng")
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("\(0.612, specifier: "%.3f") kg")
                                    .foregroundColor(Consts.primaryColor)
                                    .bold()
                            }
                            
                            HStack {
                                Text("Phí vận chuyển")
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("\(25000.000, specifier: "%.0f") VNĐ")
                                    .foregroundColor(Consts.primaryColor)
                                    .bold()
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                        }
                    } header: {
                        HStack {
                            Text("CHI TIẾT THANH TOÁN")
                                .foregroundColor(.white)
                                .bold()
                                .padding(10)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Consts.primaryColor)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        vm.os_isExpandOrderSummarySection.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "ticket")
                        Text("Áp dụng mã KM")
                    }
                    
                    Spacer()
                    
                    Divider()
                        .background(.black)
                    
                    Spacer()
                    
                    VStack {
                        Text("Tổng thanh toán")
                        Text("\(ProductModel.product.unitPrice, specifier: "%.0f") VNĐ")
                            .foregroundColor(Consts.primaryColor)
                            .bold()
                    }
                    
                    Spacer()
                }
                .frame(height: 60)
                
                Button {
                    withAnimation {
                        isShowConfirmation.toggle()
                    }
                } label: {
                    KPS_Button(
                        title: "MUA HÀNG",
                        buttonStyle: .full,
                        iconSystemName: "creditcard"
                    )
                }
                
            }
            .background(.white)
            .shadow(radius: 5)
        }
        .overlay(
            content: {
                if (isShowConfirmation) {
                    KPS_AlertView(
                        title: "Thông báo",
                        message: "Bạn có chắn chắn muốn đặt hàng?",
                        submitTitle: "Xác nhận",
                        submitAction: {
                            withAnimation {
                                print(order.path.count)
                                order.popToRoot()
                                isShowConfirmation.toggle()
                            }
                            print("go to root")
                        },
                        cancelTitle: "Huỷ") {
                            withAnimation {
                                isShowConfirmation.toggle()
                            }
                        }
                }
            })
        .useStandardToolBarStyle(title: navigationTitle) {
            EmptyView()
        }
        .onChange(of: vm.si_selectedAddress) { oldValue, newValue in
            if (oldValue != newValue) {
                withAnimation {
                    vm.onAddressChange()
                }
            }
        }
    }
}

#Preview {
    OrderPaymentView()
        .environmentObject(OrderEnvironmentViewModel())
}
