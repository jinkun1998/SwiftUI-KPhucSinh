//
//  KPS_PriceView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_PriceView: View {
    
    var price: Double
    var priceAfterDevide100: Double
    var isOldPrice: Bool = false
    
    var body: some View {
        HStack {
            Text("\(price, specifier: "%.0f")")
                .font(.system(size: 25))
                .fontWeight(.heavy)
            
            if (price > 0){
                VStack(alignment: .leading){
                    Text(".\(priceAfterDevide100, specifier: "%.0f")")
                        .font(.system(size: 9))
                        .fontWeight(.semibold)
                    Text("VND")
                        .font(.system(size: 9))
                        .fontWeight(.semibold)
                }
                .offset(x: -5)
            }
        }
        .foregroundColor(isOldPrice ? .gray : .accentColor)
        .strikethrough(isOldPrice)
    }
}

#Preview {
    KPS_PriceView(price: 999, priceAfterDevide100: 999)
}
