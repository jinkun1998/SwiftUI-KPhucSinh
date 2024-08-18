//
//  KPhucSinhApp.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct KPhucSinhApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appData = AppDataEnvironmentViewModel()
    
    var body: some Scene {
        WindowGroup {
            KPhucSinhTabView()
                .environmentObject(appData)
                .colorScheme(.light)
                .onAppear {
                    appData.handler = Auth.auth().addStateDidChangeListener { _, user in
                        appData.currentUserUid = user?.uid
                    }
                }
        }
    }
}
