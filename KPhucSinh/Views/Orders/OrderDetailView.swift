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
    var product: ProductModel
    
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
                print("added to cart")
            }, label: {
                KPS_Button(title: "THÊM VÀO GIỎ HÀNG")
            })
        }
    }
}

#Preview {
    OrderDetailView(product: ProductModel.product)
}
