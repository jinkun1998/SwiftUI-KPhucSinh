//
//  KPS_ItemView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ProductView: View {
    
    @State var product: ProductModel
    
    var body: some View {
        VStack(alignment: .center){
            
            // thumbnail image
            KPS_ImageView(url: product.images.first!.url)
                .frame(height: 130)
            
            VStack(alignment: .leading) {
                
                // name
                Text(product.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // weight
                Text(product.weight)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .frame(height: 30)
            
            HStack(alignment: .center){
                
                // add to cart
                Button {
                    print("added to cart")
                } label: {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                // price
                HStack{
                    VStack(alignment: .leading){
                        KPS_PriceView(price: product.price, priceAfterDevide100: product.priceAfterDevide100)
                    }
                    .offset(x: -5)
                }
                .foregroundColor(.accentColor)
            }
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
        .frame(width: 160)
        .containerRelativeFrame(.horizontal, count: 2, spacing: 10)
        .overlay(alignment: .center) {
            // badges
            KPS_ProductBadgeView(badges: BadgeModel.badges)
        }
    }
}

#Preview {
    KPS_ProductView(product: ProductModel.product)
}
