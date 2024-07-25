//
//  KPS_VerticalPlaceholderTextField.swift
//  KPhucSinh
//
//  Created by Jin on 25/7/24.
//

import SwiftUI

struct KPS_VerticalPlaceholderTextField: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .foregroundColor(.secondary)
            
            TextField("", text: $text)
                .overlay(alignment: .bottom) {
                    Divider()
                        .background(.black)
                        .offset(y: 5)
                }
        }
    }
}

#Preview {
    KPS_VerticalPlaceholderTextField(placeholder: "asasasas", text: .constant("ạhsvjasdasd"))
}
