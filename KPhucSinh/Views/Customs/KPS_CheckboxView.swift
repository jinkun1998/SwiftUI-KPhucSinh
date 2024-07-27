//
//  KPS_PickerView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct KPS_CheckboxView: View {
    
    var title: String
    var type: CheckboxType
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            switch type {
            case .rect:
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .tint(.clear)
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
                    }
            case .circle:
                Circle()
                    .stroke(lineWidth: 1)
                    .tint(.clear)
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
    KPS_CheckboxView(title: "Nhận hàng tại K SHOP", type: .circle, isChecked: .constant(true))
}
