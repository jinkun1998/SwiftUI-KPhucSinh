//
//  KPS_Button.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_Button: View {
    
    var title: String
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
            
            Spacer()
        }
        .frame(height: 60)
        .background(content: {
            Rectangle()
                .fill(Color.accentColor)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        })
    }
}

#Preview {
    KPS_Button(title: "THÊM VÀO GIỎ HÀNG")
}
