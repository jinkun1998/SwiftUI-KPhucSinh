//
//  StandardToolbarStyle.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import Foundation
import SwiftUI

struct StandardToolbarStyle<V>: ViewModifier where V: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var order: OrderEnvironmentViewModel
    
    var title: String
    var trailingContent: V
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.title3)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    trailingContent
                }
            }
    }
}
