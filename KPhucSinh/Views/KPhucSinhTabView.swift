//
//  ContentView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPhucSinhTabView: View {
    
    @State private var selectebTabItem = 1;
    
    var body: some View {
        TabView(selection: $selectebTabItem) {
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
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    KPhucSinhTabView()
}
