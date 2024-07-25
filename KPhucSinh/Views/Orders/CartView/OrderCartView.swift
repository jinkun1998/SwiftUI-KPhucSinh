//
//  OrderCartView.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import SwiftUI

struct OrderCartView: View {
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    private let navigationTitle: String = "Giỏ Hàng Của Bạn"
    private let carts: [CartModel] = [CartModel(product: ProductModel.product, quantity: 2)]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(order.cartItems) { cart in
                        OrderCartItemView(
                            cart: cart,
                            quantity: cart.quantity
                        )
                    }
                    Spacer()
                }
            }
            
            VStack {
                HStack {
                    Text("TẠM TÍNH")
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    KPS_PriceView(price: order.getCartTotal()[1], priceAfterDevide100: order.getCartTotal()[2])
                }
                .padding(5)
                
                NavigationLink(destination: OrderPaymentView()) {
                    KPS_Button(
                        title: "MUA HÀNG",
                        buttonStyle: .full,
                        iconSystemName: "creditcard"
                    )
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.white)
                    .frame(height: 120)
                    .shadow(radius: 20)
            }
            .padding(5)
        }
        .useStandardToolBarStyle(title: navigationTitle) {
            Button {
                order.clearCartItems()
                dismissToPreviousView()
                print("deleled all")
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
        }
        .onAppear {
            order.resetSelectedProduct()
            dismissToPreviousView()
        }
    }
    
    func dismissToPreviousView() {
        if (order.getCartCount() <= 0) {
            dismiss.callAsFunction()
        }
    }
}

#Preview {
    OrderCartView()
}
