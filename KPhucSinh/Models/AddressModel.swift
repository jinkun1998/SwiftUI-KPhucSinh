//
//  AddressModel.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import Foundation

struct AddressModel: Identifiable, Hashable {
    let id = UUID()
    let fullName: String
    let phone: String
    let address: String
    let city: Int
    let district: Int
    let ward: Int
    let isDefault: Bool
    
    static let addresses: [AddressModel] = [
        AddressModel(
            fullName: "Quốc Thảo",
            phone: "0855980201",
            address: "Toà nhà FPT Tân Thuận 3, đường Sáng Tạo, khu chế xuất Tân Thuận. Phường Tân Thuận Đông - Quận 7 - Hồ Chí Minh",
            city: 0,
            district: 0,
            ward: 0,
            isDefault: true
        )
    ]
}
