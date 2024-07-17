//
//  OrderDetailView.swift
//  KPhucSinh
//
//  Created by Jin on 10/7/24.
//

import SwiftUI

struct OrderDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var quantity = 1
    @State private var pickerSelection: Int = 0
    @State private var ratingText: String = ""
    @State private var isShowAddedToCart = false
    
    var product: ProductModel
    
    private let animationDuration: TimeInterval = 0.3
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    KPS_ImageSliderDetailView(sliders: product.images)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name)
                            .font(.title)
                            .bold()
                        
                        Text(product.weight)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.secondary)
                        
                        // star
                        HStack {
                            ForEach((1...5), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .symbolRenderingMode(.multicolor)
                            }
                            
                            Text("(Có 2 đánh giá)")
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                        .frame(height: 30)
                        
                        // gia
                        KPS_PriceView(price: product.price, priceAfterDevide100: product.priceAfterDevide1000)
                        
                        // nhan
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(BadgeModel.badges, id: \.name) {badge in
                                    KPS_BadgeView(badge: badge)
                                }
                            }
                        }
                        
                        // so luong
                        HStack {
                            Text("Số lượng")
                                .font(.title2)
                                .bold()
                            
                            KPS_MinusPlusView(quantity: $quantity)
                        }
                        
                        // so luong de xuat
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Số lượng đề xuất")
                                .font(.title2)
                                .bold()
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    KPS_SuggestQuantityView(
                                        placeholder: "Thùng 12 Gói",
                                        suggestQuantity: 12,
                                        outQuantity: $quantity)
                                    
                                    KPS_SuggestQuantityView(
                                        placeholder: "Thùng 24 Gói",
                                        suggestQuantity: 24,
                                        outQuantity: $quantity)
                                }
                            }
                        }
                        
                        // thong tin | dac tinh
                        VStack {
                            HStack(spacing: 20) {
                                Spacer()
                                
                                Text("THÔNG TIN")
                                    .font(.title2)
                                    .fontWeight(pickerSelection == 0 ? .bold : .regular)
                                    .foregroundColor(pickerSelection == 0 ? Color("ItemCartColor") : Color.secondary)
                                    .onTapGesture {
                                        pickerSelection = 0
                                    }
                                
                                Divider()
                                    .overlay(Color.accentColor)
                                
                                Text("ĐẶC TÍNH")
                                    .font(.title2)
                                    .fontWeight(pickerSelection == 1 ? .bold : .regular)
                                    .foregroundColor(pickerSelection == 1 ? Color("ItemCartColor") : Color.secondary)
                                    .onTapGesture {
                                        pickerSelection = 1
                                    }
                                
                                Spacer()
                            }
                            
                            Text(pickerSelection == 0 ? product.description : product.specification)
                                .foregroundStyle(.secondary)
                                .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("NHẬN XÉT VỀ SẢN PHẨM")
                                .font(.title2)
                                .bold()
                            
                            HStack {
                                Text("MỨC ĐỘ HÀI LÒNG")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                ForEach((1...5), id: \.self) { _ in
                                    Image(systemName: "star")
                                        .symbolRenderingMode(.multicolor)
                                }
                            }
                            
                            VStack(content: {
                                TextField("Hãy cho KPhucSinh biết ý kiến của bạn",
                                          text: $ratingText,
                                          prompt: Text("Hãy cho KPhucSinh biết ý kiến của bạn"),
                                          axis: .vertical)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                                
                                Spacer()
                            })
                            .padding()
                            .background(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(style: StrokeStyle(lineWidth: 2))
                                    .opacity(0.3)
                            })
                            .frame(height: 150)
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    print("rated")
                                } label: {
                                    KPS_Button(title: "GỬI NHẬN XÉT", height: 50)
                                }
                                
                            }
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Đánh giá của khách hàng")
                                .font(.title2)
                                .bold()
                            
                            ForEach(1...2, id: \.self) {index in
                                HStack(spacing: 20) {
                                    KPS_ImageView(
                                        url: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                        aspectRatio: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(.circle)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Tên của khách hàng")
                                            .bold()
                                        
                                        Text("Cà phê uống vừa, béo. Rất phù hợp với mình!")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(content: {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(style: StrokeStyle(lineWidth: 2), antialiased: true)
                            .opacity(0.3)
                            .shadow(color: .black, radius: 5)
                    })
                    .padding(5)
                }
            }
            .navigationBarBackButtonHidden(true)
            .useStandardToolBarStyle()
            
            Button(action: {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    isShowAddedToCart = true
                    print("added to cart")
                }
            }, label: {
                KPS_Button(title: "THÊM VÀO GIỎ HÀNG", style: .full)
            })
        }
        .blur(radius: isShowAddedToCart ? 10 : 0)
        .overlay(alignment: .bottom) {
            if (isShowAddedToCart) {
                AddedProductToCartPopupView(
                    product: ProductModel.product,
                    quantity: quantity,
                    animationDuration: 0.2,
                    isShow: $isShowAddedToCart
                )
            }
        }
        .simultaneousGesture(
            isShowAddedToCart ? TapGesture().onEnded {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    isShowAddedToCart = false
                }
            } : nil
        )
    }
}

#Preview {
    OrderDetailView(product: ProductModel.product)
}
