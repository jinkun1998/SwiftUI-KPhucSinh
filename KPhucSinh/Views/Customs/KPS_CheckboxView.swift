//
//  KPS_PickerView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct KPS_CheckboxView: View {
    
    var title: String
    var type: KPS_CheckboxType
    @Binding var isChecked: Bool
    
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
                
                Text(title)
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
                
                Text(title)
            case .capsule:
                Text(title)
                    .foregroundColor(isChecked ? .white : .black)
                    .padding()
                    .background {
                        Capsule(style: .circular)
                            .strokeBorder(.clear, lineWidth: 0, antialiased: true)
                            .background(isChecked ? Consts.primaryColor : .gray.opacity(0.4))
                    }
                    .clipShape(Capsule())
            }
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
    KPS_CheckboxView(title: "Nhận hàng tại K SHOP", type: .rect, isChecked: .constant(true))
    KPS_CheckboxView(title: "Nhận hàng tại K SHOP", type: .capsule, isChecked: .constant(true))
}
