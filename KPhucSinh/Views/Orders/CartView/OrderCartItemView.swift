//
//  OrderCartItemView.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import SwiftUI

struct OrderCartItemView: View {
    
    var product: ProductModel
    var quantity: Int = 1
    
    var body: some View {
        HStack {
            KPS_ImageView(url: product.images.first!.url, aspectRatio: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(product.name)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                    
                    Button {
                        print("deleted \(product.id)")
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 30, height: 30)
                }
                
                Text(product.weight)
                    .font(.callout)
                    .italic()
                
                HStack {
                    KPS_MinusPlusView(quantity: $quantity, width: 120, height: 30)
                    
                    Spacer()
                    
                    KPS_PriceView(price: product.price, priceAfterDevide100: product.priceAfterDevide1000)
                }
            }
        }
    }
}

#Preview {
    OrderCartItemView(product: ProductModel.product, quantity: .constant(2))
}
