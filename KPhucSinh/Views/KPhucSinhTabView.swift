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
        NavigationView {
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
                .toolbarBackground(.background, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .colorScheme(.light)
        }
    }
}

#Preview {
    KPhucSinhTabView()
}
