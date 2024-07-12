//
//  KPS_MinusPlusView.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import SwiftUI

struct KPS_MinusPlusView: View {
    
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Button {
                print("minus")
                quantity = quantity > 1 ? quantity - 1 : 1
            } label: {
                Image(systemName: "minus")
            }
            .frame(width: 30)
            
            TextField("", value: $quantity, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            Button {
                print("plus")
                quantity = quantity + 1
            } label: {
                Image(systemName: "plus")
            }
            .frame(width: 30)
        }
        .frame(width: 120, height: 50)
        .background(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .opacity(0.3)
                .frame(height: 35)
        })
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
    }
}

#Preview {
    KPS_MinusPlusView(quantity: .constant(5))
}
