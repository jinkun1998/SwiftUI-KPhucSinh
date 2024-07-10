//
//  OrderDetailView.swift
//  KPhucSinh
//
//  Created by Jin on 10/7/24.
//

import SwiftUI

struct OrderDetailView: View {
    
    var product: ProductModel
    
    var body: some View {
        ScrollView {
            VStack {
                KPS_ImageSliderDetailView(sliders: product.images)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title)
                        .bold()
                    
                    Text(product.weight)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    // star
                    
                    KPS_PriceView(price: product.price, priceAfterDevide100: product.priceAfterDevide1000)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(BadgeModel.badges, id: \.name) {badge in
                                KPS_BadgeView(badge: badge)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .overlay(alignment: .bottom) {
            Button(action: {
                print("added to cart")
            }, label: {
                Text("THÊM VÀO GIỎ HÀNG")
            })
        }
    }
}

#Preview {
    OrderDetailView(product: ProductModel.product)
}
