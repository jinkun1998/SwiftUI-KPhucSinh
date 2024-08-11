//
//  KPS_IconTextField.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import SwiftUI

struct KPS_IconTextField: View {
    
    var placeHolder: String
    var systenImage: String
    var keyboardType: UIKeyboardType = .default
    var isSecureField: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: systenImage)
                    .foregroundStyle(.secondary)
                
                if isSecureField {
                    SecureField(placeHolder, text: $text)
                        .textFieldStyle(.plain)
                        .keyboardType(keyboardType)
                } else {
                    TextField(placeHolder, text: $text)
                        .textFieldStyle(.plain)
                        .keyboardType(keyboardType)
                }
            }
            
            Divider()
                .background(.black.opacity(0.8))
        }
    }
}

#Preview {
    KPS_IconTextField(
        placeHolder: "Nhập số ĐT / Email",
        systenImage: "person.fill",
        text: .constant("HEllo")
    )
}
