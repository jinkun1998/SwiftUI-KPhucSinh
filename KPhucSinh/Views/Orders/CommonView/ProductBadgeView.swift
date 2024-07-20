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
                    KPS_BadgeView(badge: badge)
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: 55, y: -100)
                }
                else{
                    KPS_BadgeView(badge: badge)
                        .offset(x:-25, y: -90)
                }
            }
        }
    }
}

#Preview {
    ProductBadgeView(badges: BadgeModel.badges)
}
