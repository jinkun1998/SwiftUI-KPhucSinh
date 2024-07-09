//
//  KPS_ItemView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_FlashSaleProductView: View {
    
    private let date = Date.fromTimeInterval(Date.getTimeInterval(component: .day) * 3)
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
                        .frame(width: 20, height: 20)
                }
            }
            .offset(x: -20, y: -5)
            
            // MARK: Thumbnail image
            KPS_ImageView(url: product.images.first!.url)
                .frame(height: 130)
            
            // MARK: Time countdown
            HStack(spacing: 10) {
                // date
                KPS_CountdownTimerView(date: date, component: .day, componentName: "Ngày")
                // hour
                KPS_CountdownTimerView(date: date, component: .hour, componentName: "Giờ")
                // minute
                KPS_CountdownTimerView(date: date, component: .minute, componentName: "Phút")
                // second
                KPS_CountdownTimerView(date: date, component: .second, componentName: "Giây")
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
//        .containerRelativeFrame(.horizontal, count: 2, spacing: 10)
        .overlay(alignment: .center) {
            // badges
            KPS_ProductBadgeView(badges: BadgeModel.badges)
                .offset(y: -10)
        }
    }
}

#Preview {
    KPS_FlashSaleProductView(product: ProductModel.product)
}
