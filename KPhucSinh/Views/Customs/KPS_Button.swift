//
//  KPS_Button.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_Button: View {
    
    var title: String
    var buttonStyle: KPS_ButtonStyle = .compact
    var iconSystemName: String = ""
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var body: some View {
        if (width > 0 && height <= 0) {
            _content()
                .frame(width: width)
        }
        else if (width <= 0 && height > 0) {
            _content()
                .frame(height: height)
        }
        else if (width > 0 && height > 0) {
            _content()
                .frame(width: width, height: height)
        }
        else {
            _content()
        }
    }
    
    @ViewBuilder
    func _content() -> some View {
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
