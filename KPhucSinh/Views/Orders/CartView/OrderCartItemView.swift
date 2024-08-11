//
//  OrderCartItemView.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import SwiftUI

struct OrderCartItemView: View {
    
    @EnvironmentObject var appData: AppDataEnvironmentViewModel
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    var cart: CartModel
    @State var quantity: Int
    
    var body: some View {
        HStack {
            KPS_ImageView(url: cart.images.first!.url, aspectRatio: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(cart.name)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            print("deleted \(cart.id)")
                            appData.removeFromCart(appData.cartItems.firstIndex(where: {$0.id == cart.id})!)
                            dismissToPreviousView()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 30, height: 30)
                }
                
                Text(cart.weight)
                    .font(.callout)
                    .italic()
                
                HStack {
                    KPS_MinusPlusView(
                        quantity: $quantity,
                        width: 120,
                        height: 30,
                        minusAction: {
                            withAnimation {
                                appData.minusProductQuantity(cart: cart)
                                dismissToPreviousView()
                            }
                        },
                        plusAction: {
                            withAnimation {
                                appData.plusProductQuantity(cart: cart)
                            }
                        }
                    )
                    
                    Spacer()
                    
                    KPS_PriceView(price: cart.price, priceAfterDevide100: cart.priceAfterDevide1000)
                }
            }
        }
    }
    
    func dismissToPreviousView() {
        if (appData.getCartCount() <= 0) {
            dismiss.callAsFunction()
        }
    }
}

#Preview {
    OrderCartItemView(cart: CartModel(product: ProductModel.product, quantity: 1), quantity: 2)
}
