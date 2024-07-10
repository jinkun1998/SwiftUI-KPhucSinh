//
//  KPS_ProductBadgeView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct ProductBadgeView: View {
    
    var badges: [BadgeModel]
    
    var body: some View {
        VStack{
            ForEach(badges, id: \.name) { badge in
                if (badge.isSale){
                    Text(badge.name)
                        .font(Font.system(size: 13))
                        .fontWeight(.heavy)
                        .frame(height: 13)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("ProductBadgeColor"))
                        )
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: 55, y: -100)
                }
                else{
                    Text(badge.name)
                        .font(Font.system(size: 13))
                        .fontWeight(.heavy)
                        .frame(height: 13)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("ProductBadgeColor"))
                        )
                        .offset(x:-25, y: -90)
                }
            }
        }
    }
}

#Preview {
    ProductBadgeView(badges: BadgeModel.badges)
}
