//
//  KPS_DropdownBox.swift
//  KPhucSinh
//
//  Created by Jin on 4/8/24.
//

import SwiftUI

struct KPS_DropdownBox: View {
    
    var placeholder: String
    var items: [DropdownBoxModel]
    @Binding var selectedItem: DropdownBoxModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
            Menu {
                ForEach(items) { element in
                    Button {
                        selectedItem = element
                    } label: {
                        Text("\(element.name)")
                    }

                }
            } label: {
                HStack {
                    Text(selectedItem?.name ?? "Chọn \(placeholder)")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2)
                        .fill(Consts.primaryColor)
                }
            }
        }
    }
}

#Preview {
    KPS_DropdownBox(
        placeholder: "Tỉnh/Thành",
        items: [
            DropdownBoxModel(
                originalId: 1,
                name: "Hồ Chí Minh"
            ),
            DropdownBoxModel(
                originalId: 2,
                name: "Hà Nội"
            )
        ],
        selectedItem: .constant(DropdownBoxModel(originalId: 1, name: "Hồ Chí Minh"))
    )
}
