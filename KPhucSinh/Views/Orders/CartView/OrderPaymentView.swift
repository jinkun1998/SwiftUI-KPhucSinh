//
//  OrderPaymentView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct OrderPaymentView: View {
    
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    @State var fullName: String = ""
    @State var isExportVAT: Bool = true
    @State var isExpand: Bool = true
    @State var isShowConfirmation: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Section(isExpanded: $isExpand) {
                        VStack(alignment: .leading, spacing: 10) {
                            KPS_VerticalPlaceholderTextField(placeholder: "Họ tên", text: $fullName)
                            KPS_VerticalPlaceholderTextField(placeholder: "Số điện thoại", text: $fullName)
                            KPS_VerticalPlaceholderTextField(placeholder: "Email", text: $fullName)
                            KPS_CheckboxView(title: "THÔNG TIN XUẤT HOÁ ĐƠN", type: .circle, isChecked: $isExportVAT)
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
                                        isExpand.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $isExpand) {
                        VStack(alignment: .leading) {
                            KPS_CheckboxView(title: "Nhận hàng tại K SHOP", type: .rect, isChecked: $isExportVAT)
                            
                            KPS_CheckboxView(title: "Nhận hàng tận nơi", type: .rect, isChecked: $isExportVAT)
                            
                            HStack(alignment: .bottom) {
                                KPS_VerticalPlaceholderTextField(placeholder: "Địa chỉ giao hàng", text: $fullName)
                                
                                Button {
                                    print("change address")
                                } label: {
                                    KPS_Button(title: "THAY ĐỔI", height: 40)
                                }
                            }
                            
                            KPS_VerticalPlaceholderTextField(placeholder: "Ghi chú khi giao hàng", text: $fullName)
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
                                        isExpand.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $isExpand) {
                        VStack(alignment: .leading) {
                            KPS_CheckboxView(title: "Thanh toán khi nhận hàng", type: .rect, isChecked: $isExportVAT)
                            
                            KPS_CheckboxView(title: "Chuyển khoản ngân hàng", type: .rect, isChecked: $isExportVAT)
                            
                            KPS_CheckboxView(title: "Thẻ ATM nội địa", type: .rect, isChecked: $isExportVAT)
                            
                            KPS_CheckboxView(title: "Thẻ tín dụng/ ghi nợ (VISA, MASTER CARD,...)", type: .rect, isChecked: $isExportVAT)
                            
                            HStack {
                                KPS_CheckboxView(title: "Ví MoMo", type: .rect, isChecked: $isExportVAT)
                                
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
                                        isExpand.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $isExpand) {
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
                                        isExpand.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Section(isExpanded: $isExpand) {
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
                                        isExpand.toggle()
                                    }
                                }
                            
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            .useStandardToolBarStyle(title: "Thanh toán") {
                EmptyView()
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
    }
}

#Preview {
    OrderPaymentView()
        .environmentObject(OrderEnvironmentViewModel())
}
