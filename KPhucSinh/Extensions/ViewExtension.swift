//
//  ViewExtension.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import Foundation
import SwiftUI

extension View {
    
    func useStandardToolBarStyle<V>(title: String, @ViewBuilder trailingContent: @escaping () -> V) -> some View where V: View {
        return self
            .padding(.top, 10)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .modifier(StandardToolbarStyle<V>(title: title, trailingContent: trailingContent()))
    }
    
    func appearAfter(_ delay: Double) -> some View {
        self
            .modifier(DelayViewStyle(delay: delay))
    }
}
