//
//  KPS_Button.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_Button: View {
    
    var title: String
    var buttonStyle: ButtonStyle = .compact
    var iconSystemName: String = ""
    var width: CGFloat = .infinity
    var height: CGFloat = .infinity
    
    enum ButtonStyle {
        case compact
        case full
    }
    
    var body: some View {
        HStack(spacing: 20) {
            
            if buttonStyle == .full {
                Spacer()
            }
            
            if (!iconSystemName.isEmpty) {
                Image(systemName: iconSystemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(height: 25)
            }
            
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .bold()
            
            if buttonStyle == .full {
                Spacer()
            }
        }
        .padding()
        .frame(width: width, height: height)
        .background(content: {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.accentColor)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        })
    }
}

#Preview {
    KPS_Button(title: "THÊM VÀO GIỎ HÀNG", buttonStyle: .full, iconSystemName: "creditcard")
}
