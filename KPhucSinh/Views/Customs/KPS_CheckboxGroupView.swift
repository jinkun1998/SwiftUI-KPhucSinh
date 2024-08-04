//
//  KPS_PickerView.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct KPS_CheckboxGroupView: View {
    
    var axis: Axis.Set = .vertical
    var type: CheckboxType
    var verticalAlignment: VerticalAlignment = .center
    var horizontalAlignment: HorizontalAlignment = .center
    @Binding var values: [CheckboxModel]
    
    var body: some View {
        ScrollView(axis, showsIndicators: false) {
            switch axis {
            case .horizontal:
                HStack(alignment: verticalAlignment) {
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
                                
                                HStack {
                                    Text(value.title)
                                    
                                    if (!value.iconURL.isEmpty) {
                                        KPS_ImageView(url: value.iconURL, aspectRatio: .fit)
                                            .frame(width: 30, height: 30)
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
                                
                                HStack {
                                    Text(value.title)
                                    
                                    if (!value.iconURL.isEmpty) {
                                        KPS_ImageView(url: value.iconURL, aspectRatio: .fit)
                                            .frame(width: 30, height: 30)
                                    }
                                }
                            case .capsule:
                                Text(value.title)
                                    .foregroundColor(value.isChecked ? .white : .black)
                                    .padding()
                                    .background {
                                        Capsule(style: .circular)
                                            .strokeBorder(.clear, lineWidth: 0, antialiased: true)
                                            .background(value.isChecked ? Consts.primaryColor : .gray.opacity(0.4))
                                    }
                                    .clipShape(Capsule())
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
            default:
                VStack(alignment: horizontalAlignment) {
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
                                
                                HStack {
                                    Text(value.title)
                                    
                                    if (!value.iconURL.isEmpty) {
                                        KPS_ImageView(url: value.iconURL, aspectRatio: .fit)
                                            .frame(width: 30, height: 30)
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
                                
                                HStack {
                                    Text(value.title)
                                    
                                    if (!value.iconURL.isEmpty) {
                                        KPS_ImageView(url: value.iconURL, aspectRatio: .fit)
                                            .frame(width: 30, height: 30)
                                    }
                                }
                            case .capsule:
                                Text(value.title)
                                    .foregroundColor(value.isChecked ? .white : .black)
                                    .padding()
                                    .background {
                                        Capsule(style: .circular)
                                            .strokeBorder(.clear, lineWidth: 0, antialiased: true)
                                            .background(value.isChecked ? Consts.primaryColor : .gray.opacity(0.4))
                                    }
                                    .clipShape(Capsule())
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
        }
        .scrollDisabled(axis == .vertical)
    }
}

#Preview {
    @Bindable var vm = OrderPaymentViewModel()
    KPS_CheckboxGroupView(axis: .vertical, type: .capsule, values: $vm.pm_paymentMethods)
}
