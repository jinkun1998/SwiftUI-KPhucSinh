//
//  StandardToolbarStyle.swift
//  KPhucSinh
//
//  Created by Jin on 12/7/24.
//

import Foundation
import SwiftUI

struct StandardToolbarStyle: ViewModifier {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
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
                    Text("Chi Tiết Sản Phẩm")
                        .font(.title3)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 10) {
                        Button {
                            print("added to cart")
                        } label: {
                            Image(systemName: "suit.heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        
                        Button {
                            print("added to cart")
                        } label: {
                            Image(systemName: "cart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        .background(.yellow)
                        .overlay(alignment: .center) {
                            Text("5")
                                .font(.callout)
                                .offset(y: -15)
                        }
                    }
                }
            }
    }
}
