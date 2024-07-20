//
//  OrderCartView.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import SwiftUI

struct OrderCartView: View {
    
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    private let navigationTitle: String = "Giỏ Hàng Của Bạn"
    private let carts: [CartModel] = []
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(carts) { cart in
                        
                    }
                }
            }
        }
        .useStandardToolBarStyle(title: navigationTitle) {
            Button {
                order.clearCartItems()
                print("deleled all")
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

#Preview {
    OrderCartView()
}
