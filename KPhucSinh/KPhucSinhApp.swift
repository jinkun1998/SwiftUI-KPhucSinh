//
//  KPhucSinhApp.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

@main
struct KPhucSinhApp: App {
    
    @State private var order = OrderEnvironmentViewModel()
    
    var body: some Scene {
        WindowGroup {
            KPhucSinhTabView()
                .environmentObject(order)
                .colorScheme(.light)
        }
    }
}
