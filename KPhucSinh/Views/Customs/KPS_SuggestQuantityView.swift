//
//  KPS_SuggestQuantityView.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_SuggestQuantityView: View {
    
    var placeholder: String
    var suggestQuantity: Int
    @Binding var outQuantity: Int
    
    var body: some View {
        Text(placeholder)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .frame(width: 100, height:  50)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .opacity(0.3)
            }
            .onTapGesture {
                outQuantity = suggestQuantity
            }
        
    }
}

#Preview {
    KPS_SuggestQuantityView(
        placeholder: "Thùng 12 Gói",
        suggestQuantity: 12,
        outQuantity: .constant(12))
}
