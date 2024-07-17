//
//  AddedProductToCartPopupView.swift
//  KPhucSinh
//
//  Created by Jin on 17/7/24.
//

import SwiftUI

struct AddedProductToCartPopupView: View {
    
    var product: ProductModel
    var quantity: Int
    var animationDuration: CGFloat
    @Binding var isShow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sản phẩm đã được thêm vào giỏ hàng")
                .font(.title3)
                .foregroundColor(Color("ItemCartColor"))
            
            HStack(spacing: 25) {
                KPS_ImageView(url: product.images.first!.url, aspectRatio: .fill)
                    .frame(width: 60, height: 60)
                    .appearAfter(0.25)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title3)
                    
                    HStack {
                        Text("Số lượng:")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        Text("\(quantity)")
                            .font(.title3)
                    }
                    
                    HStack {
                        Text("Đơn giá:")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        Text("\(product.price, specifier: "%.0f").\(product.priceAfterDevide1000, specifier: product.priceAfterDevide1000 > 0 ? "%.0f": "000") VNĐ")
                            .font(.title3)
                    }
                }
            }
            
            Button {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    isShow = false
                    print("go to cart")
                }
            } label: {
                KPS_Button(title: "Xem giỏ hàng", style: .full)
            }
            
        }
        .padding()
        .background(content: {
            UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15)
                .fill(.background)
                .frame(height: .infinity)
                .shadow(radius: 20)
        })
        .transition(AnyTransition.move(edge: .bottom))
        .offset(y: 15)
    }
}

#Preview {
    AddedProductToCartPopupView(
        product: ProductModel.product,
        quantity: 2,
        animationDuration: 0.2,
        isShow: .constant(true)
    )
}
