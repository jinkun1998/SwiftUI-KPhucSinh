//
//  KPS_ProductBadgeView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ProductBadgeView: View {
    
    @State var badges: [BadgeModel]
    
    var body: some View {
        VStack{
            ForEach(badges, id: \.name) { badge in
                if (badge.isSale){
                    Text(badge.name)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .frame(height: 20)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("ProductBadgeColor"))
                        )
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: 70, y: -100)
                }
                else{
                    Text(badge.name)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .frame(height: 20)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("ProductBadgeColor"))
                        )
                        .offset(x:-35, y: -90)
                }
            }
        }
    }
}

#Preview {
    KPS_ProductBadgeView(badges: BadgeModel.badges)
}
