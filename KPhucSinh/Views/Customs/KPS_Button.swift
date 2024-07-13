//
//  KPS_Button.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_Button: View {
    
    var title: String
    var style: ButtonStyle = .normal
    var width: CGFloat = .infinity
    var height: CGFloat = .infinity
    
    enum ButtonStyle {
        case normal
        case full
    }
    
    var body: some View {
        HStack {
            
            if style == .full {
                Spacer()
            }
            
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
            
            if style == .full {
                Spacer()
            }
        }
        .padding()
        .frame(width: width, height: height)
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
