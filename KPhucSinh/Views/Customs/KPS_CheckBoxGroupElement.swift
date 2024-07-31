//
//  KPS_CheckBoxGroupElement.swift
//  KPhucSinh
//
//  Created by Jin on 30/7/24.
//

import SwiftUI

struct KPS_CheckBoxGroupElement: View {
    
    var title: String
    var type: CheckboxType
    @State private var isChecked: Bool = false
    
    var body: some View {
        HStack {
            switch type {
            case .rect:
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .tint(.white)
                    .frame(width: 30, height: 30)
                    .overlay {
                        if (isChecked) {
                            Image(systemName: "checkmark.square.fill")
                                .resizable()
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, Consts.primaryColor)
                                .transition(.scale.animation(.bouncy(duration: 0.2, extraBounce: 0.1)))
                                .frame(width: 25, height: 25)
                        }
                        else {
                            Rectangle()
                                .fill(.white)
                                .frame(width: 25, height: 25)
                        }
                    }
            case .circle:
                Circle()
                    .stroke(lineWidth: 1)
                    .tint(.white)
                    .frame(width: 30, height: 30)
                    .overlay {
                        if (isChecked) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, Consts.primaryColor)
                                .transition(.scale.animation(.bouncy(duration: 0.2, extraBounce: 0.1)))
                                .frame(width: 25, height: 25)
                        }
                        else {
                            Circle()
                                .fill(.white)
                                .frame(width: 25, height: 25)
                        }
                    }
            }
            
            Text(title)
        }
        .onTapGesture {
            withAnimation {
                isChecked.toggle()
            }
        }
    }
}

#Preview {
    KPS_CheckBoxGroupElement(title: "Nhận hàng tại K SHOP", type: .circle)
    KPS_CheckBoxGroupElement(title: "Nhận hàng tại K SHOP", type: .rect)
}
