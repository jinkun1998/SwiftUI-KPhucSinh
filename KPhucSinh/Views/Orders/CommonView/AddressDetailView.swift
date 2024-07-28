//
//  AddressDetailView.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import SwiftUI

struct AddressDetailView: View {
    
    @State private var fullName: String = ""
    
    var body: some View {
        VStack {
            KPS_VerticalPlaceholderTextField(placeholder: "Họ tên", text: $fullName)
        }
    }
}

#Preview {
    AddressDetailView()
}
