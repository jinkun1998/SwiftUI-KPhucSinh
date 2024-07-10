//
//  KPS_BadgeView.swift
//  KPhucSinh
//
//  Created by Jin on 10/7/24.
//

import SwiftUI

struct KPS_BadgeView: View {
    
    var badge: BadgeModel
    
    var body: some View {
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
    }
}

#Preview {
    KPS_BadgeView(badge: BadgeModel.badges.first!)
}
