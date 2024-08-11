//
//  OrderCartItemSummaryView.swift
//  KPhucSinh
//
//  Created by Jin on 5/8/24.
//

import SwiftUI

struct OrderCartItemSummaryView: View {
    
    var cartItem: CartModel
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    KPS_ImageView(url: cartItem.images.first!.url, aspectRatio: .fit)
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(cartItem.name)
                        
                        Text("Số lượng x \(cartItem.quantity)")
                        
                        HStack {
                            Text("Đơn giá ")
                            
                            Text("\(cartItem.unitPrice, specifier: "%.0f") VNĐ")
                                .bold()
                                .italic()
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Tổng giá ")
                    
                    Text("\(ProductModel.product.unitPrice, specifier: "%.0f") VNĐ")
                        .bold()
                        .italic()
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .background(.white)
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation(.easeInOut) {
                        isShow.toggle()
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Consts.primaryColor)
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .tint(.white)
                    }
                }
                .offset(x: 5, y: -10)
            }
            .padding()
        }
        .transition(.blurReplace)
    }
}

#Preview {
    OrderCartItemSummaryView(cartItem: CartModel(product: ProductModel.product, quantity: 1), isShow: .constant(true))
}
