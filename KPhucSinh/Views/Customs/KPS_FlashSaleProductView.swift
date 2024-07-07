//
//  KPS_ItemView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_FlashSaleProductView: View {
    
    @State var product: ProductModel
    
    var body: some View {
        VStack(alignment: .center){
            
            // MARK: Add to cart
            HStack{
                Spacer()
                
                Button {
                    print("added to cart")
                } label: {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .offset(x: -15)
            
            // MARK: Thumbnail image
            AsyncImage(url: URL(string: product.images.first!.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .tint(.accentColor)
            }
            .frame(height: 150)
            
            // MARK: Time countdown
            HStack(spacing: 20) {
                // date
                KPS_CountdownTimerView(component: .day, componentName: "Ngày")
                // hour
                KPS_CountdownTimerView(component: .hour, componentName: "Giờ")
                // minute
                KPS_CountdownTimerView(component: .minute, componentName: "Phút")
                // second
                KPS_CountdownTimerView(component: .second, componentName: "Giây")
            }
            .frame(height: 50)
            
            // MARK: Name + unit
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
            
            // MARK: Price
            HStack(alignment: .center){
                //old price
                KPS_PriceView(price: 0, priceAfterDevide100: 0, isOldPrice: true)
                // new price
                KPS_PriceView(price: product.price, priceAfterDevide100: product.priceAfterDevide100)
            }
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
        .frame(width: 200)
        .containerRelativeFrame(.horizontal, count: 2, spacing: 10)
    }
}

#Preview {
    KPS_FlashSaleProductView(product: ProductModel.product)
}
