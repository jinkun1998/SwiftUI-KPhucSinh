//
//  KPS_MaterialTextField.swift
//  KPhucSinh
//
//  Created by Jin on 31/7/24.
//

import SwiftUI

struct KPS_MaterialTextField: View {
    
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        Group {
            TextField("", text: $text)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(style: StrokeStyle(lineWidth: 1.5))
                        .fill(Consts.primaryColor)
                        .overlay(alignment: .topLeading) {
                            Text(placeHolder)
                                .font(.footnote)
                                .foregroundColor(Consts.primaryColor)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                                .background(.white)
                                .offset(x: 10, y: -10)
                        }
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
        }
        .background(.white)
    }
}

#Preview {
    KPS_MaterialTextField(placeHolder: "Họ tên", text: .constant("HEllo"))
}
