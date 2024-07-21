//
//  ProductQuickView.swift
//  KPhucSinh
//
//  Created by Jin on 17/7/24.
//

import SwiftUI

struct ProductQuickView: View {
    
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    private let animationDuration: CGFloat = Consts.animationDuration
    
    var product: ProductModel
    @Binding var quantity: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tuỳ chọn sản phẩm")
                .font(.title3)
                .foregroundColor(Color("ItemCartColor"))
            
            HStack(spacing: 25) {
                KPS_ImageView(url: product.images.first!.url, aspectRatio: .fill)
                    .frame(width: 80, height: 80)
                    .appearAfter(0.25)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title3)
                    
                    HStack {
                        Text("Số lượng")
                            .font(.title2)
                            .bold()
                        
                        KPS_MinusPlusView(quantity: $quantity, width: 120, height: 30)
                    }
                    
                    HStack {
                        Text("Đơn giá:")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        Text("\(product.price, specifier: "%.0f").\(product.priceAfterDevide1000, specifier: product.priceAfterDevide1000 > 0 ? "%.0f": "000") VNĐ")
                            .font(.title3)
                            .bold()
                    }
                }
            }
            
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
            .padding()
            
            Button {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    print("added to cart")
                    order.addToCart(product: product, quantity: quantity, showPopup: .addedToCart)
                }
            } label: {
                KPS_Button(title: "Thêm Vào Giỏ Hàng", buttonStyle: .full)
            }
            
        }
        .padding(EdgeInsets(top: 20, leading: 10, bottom: 40, trailing: 10))
        .background(content: {
            UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15)
                .fill(.background)
                .frame(height: .infinity)
                .shadow(radius: 20)
        })
        .transition(AnyTransition.move(edge: .bottom))
        .offset(y: 15)
        .onAppear() {
            quantity = 1
        }
    }
}

#Preview {
    ProductQuickView(
        product: ProductModel.product,
        quantity: .constant(2)
    )
}
