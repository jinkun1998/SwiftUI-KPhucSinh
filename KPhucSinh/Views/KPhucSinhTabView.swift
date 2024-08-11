//
//  ContentView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPhucSinhTabView: View {
    
    @EnvironmentObject var order: AppDataEnvironmentViewModel
    
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
            .navigationDestination(for: ProductModel.self) { product in
                OrderDetailView(product: product)
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "OrderCartView":
                    OrderCartView()
                case "LoginView":
                    LoginView()
                case "RegisterView":
                   RegisterView()
                case "ForgotPasswordView":
                    ForgotPasswordView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    KPhucSinhTabView()
        .environmentObject(AppDataEnvironmentViewModel())
}
