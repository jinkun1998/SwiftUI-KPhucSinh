//
//  ContentView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPhucSinhTabView: View {
    var body: some View {
        TabView {
            StoreView()
                .tabItem {
                    Label("Hệ thống K COFFEE", systemImage: "storefront")
                }
            
            OrderView()
                .tabItem {
                    Label("Đặt hàng", systemImage: "box.truck")
                }
            
            PersonalView()
                .tabItem {
                    Label("Cá nhân", systemImage: "person")
                }
        }
    }
}

#Preview {
    KPhucSinhTabView()
}
