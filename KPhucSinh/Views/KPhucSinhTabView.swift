//
//  ContentView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPhucSinhTabView: View {
    
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    @State private var selectebTabItem = 1;
    @State private var quantity: Int = 1
    
    var body: some View {
        NavigationStack(path: $order.path) {
            TabView(selection: $selectebTabItem) {
                Group {
                    StoreView()
                        .tabItem {
                            Label("Hệ thống K COFFEE", systemImage: "storefront")
                        }
                        .tag(0)
                    
                    OrderView()
                        .tabItem {
                            Label("Đặt hàng", systemImage: "box.truck")
                        }
                        .tag(1)
                    
                    PersonalView()
                        .tabItem {
                            Label("Cá nhân", systemImage: "person")
                        }
                        .tag(2)
                }
                .toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .overlay(alignment: .bottom) {
                if (order.canShowPopup(.productQuickView)) {
                    ProductQuickView(
                        product: order.getSelectedProduct()!,
                        quantity: $quantity
                    )
                }
                
                if (order.canShowPopup(.addedToCart)) {
                    AddedProductToCartPopupView(
                        product: order.getSelectedProduct()!,
                        quantity: quantity
                    )
                }
            }
            .ignoresSafeArea()
            .toolbar(.hidden)
        }
    }
}

#Preview {
    KPhucSinhTabView()
}
