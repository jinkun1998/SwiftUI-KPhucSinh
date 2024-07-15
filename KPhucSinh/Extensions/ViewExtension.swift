//
//  ViewExtension.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import Foundation
import SwiftUI

extension View {
    
    func useStandardToolBarStyle() -> some View {
        self
            .modifier(StandardToolbarStyle())
    }
    
    func appearAfter(_ delay: Double) -> some View {
        self
            .modifier(DelayViewStyle(delay: delay))
    }
}
