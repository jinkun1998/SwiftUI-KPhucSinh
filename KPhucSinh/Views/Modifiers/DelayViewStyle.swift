//
//  DelayViewStyle.swift
//  KPhucSinh
//
//  Created by Jin on 15/7/24.
//

import SwiftUI

struct DelayViewStyle: ViewModifier {
    
    var delay: Double
    @State private var isShowView = false
    
    func body(content: Content) -> some View {
        _content(content: content)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.easeIn(duration: delay)) {
                        isShowView = true
                    }
                }
            }
    }
    
    @ViewBuilder
    private func _content(content: Content) -> some View {
        if (isShowView){
            content
        }
        else{
            content
                .hidden()
        }
    }
}
