////
////  KPS_PickerView.swift
////  KPhucSinh
////
////  Created by Jin on 25/7/24.
////
//
//import SwiftUI
//
//struct KPS_CheckboxGroupView: View {
//    
//    var type: CheckboxType
//    var values: [CheckboxModel]
//    @Binding var selectedValue: CheckboxModel?
//    
//    var body: some View {
//        Group {
//            ForEach(values, id: \.id) { checkbox in
//                HStack {
//                    switch type {
//                    case .rect:
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(lineWidth: 1)
//                            .tint(.white)
//                            .frame(width: 30, height: 30)
//                            .overlay {
//                                if (checkbox.isChecked) {
//                                    Image(systemName: "checkmark.square.fill")
//                                        .resizable()
//                                        .symbolRenderingMode(.palette)
//                                        .foregroundStyle(.white, Consts.primaryColor)
//                                        .transition(.scale.animation(.bouncy(duration: 0.2, extraBounce: 0.1)))
//                                        .frame(width: 25, height: 25)
//                                }
//                                else {
//                                    Rectangle()
//                                        .fill(.white)
//                                        .frame(width: 25, height: 25)
//                                }
//                            }
//                    case .circle:
//                        Circle()
//                            .stroke(lineWidth: 1)
//                            .tint(.white)
//                            .frame(width: 30, height: 30)
//                            .overlay {
//                                if (checkbox.isChecked) {
//                                    Image(systemName: "checkmark.circle.fill")
//                                        .resizable()
//                                        .symbolRenderingMode(.palette)
//                                        .foregroundStyle(.white, Consts.primaryColor)
//                                        .transition(.scale.animation(.bouncy(duration: 0.2, extraBounce: 0.1)))
//                                        .frame(width: 25, height: 25)
//                                }
//                                else {
//                                    Circle()
//                                        .fill(.white)
//                                        .frame(width: 25, height: 25)
//                                }
//                            }
//                    }
//                    
//                    HStack {
//                        Text(checkbox.title)
//                        
//                        KPS_ImageView(imageURL: checkbox.iconURL)
//                            .frame(width: 20, height: 20)
//                    }
//                }
////                .onTapGesture {
////                    guard var value = values.first(where: {$0.id == checkbox.id}) else { return }
////                    value.isChecked = true
////                    values = values.map {$0.id == value.id ? value : $0 }
////                }
//            }
//        }
//    }
//}
//
//#Preview {
//    @Bindable var vm = OrderPaymentViewModel()
//    KPS_CheckboxGroupView(type: .circle, values: vm.si_shippingMethods, selectedValue: $vm.si_selectedShippingMethod)
//}
