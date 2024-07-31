//
//  KPS_PickerView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct KPS_CheckboxGroupView: View {
    
    var type: CheckboxType
    @Binding var values: [CheckboxModel]
    
    var body: some View {
        ForEach(values) { value in
            HStack {
                switch type {
                case .rect:
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .tint(.white)
                        .frame(width: 30, height: 30)
                        .overlay {
                            if (value.isChecked) {
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
                            if (value.isChecked) {
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
                
                HStack {
                    Text(value.title)
                    
                    if (!value.iconURL.isEmpty) {
                        KPS_ImageView(url: value.iconURL, aspectRatio: .fit)
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .onTapGesture {
                withAnimation {
                    values = values.map({ checkbox in
                        return CheckboxModel(
                            id: checkbox.id,
                            title: checkbox.title,
                            isChecked: checkbox.id == value.id ? true : false,
                            iconURL: checkbox.iconURL
                        )
                    })
                }
            }
        }
    }
}

#Preview {
    @Bindable var vm = OrderPaymentViewModel()
    KPS_CheckboxGroupView(type: .circle, values: $vm.pm_paymentMethods)
}
