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
    let isDefault: Bool
    
    static let addresses: [AddressModel] = [
        AddressModel(
            fullName: "Quốc Thảo",
            phone: "0855980201",
            address: "Toà nhà FPT Tân Thuận 3, đường Sáng Tạo, khu chế xuất Tân Thuận. Phường Tân Thuận Đông - Quận 7 - Hồ Chí Minh",
            isDefault: true
        ),
        AddressModel(
            fullName: "Quốc Thảo 1",
            phone: "0855980201",
            address: "Toà nhà FPT Tân Thuận 3, đường Sáng Tạo, khu chế xuất Tân Thuận. Phường Tân Thuận Đông - Quận 7 - Hồ Chí Minh",
            isDefault: false
        ),
        AddressModel(
            fullName: "Quốc Thảo 2",
            phone: "0855980201",
            address: "Toà nhà FPT Tân Thuận 3, đường Sáng Tạo, khu chế xuất Tân Thuận. Phường Tân Thuận Đông - Quận 7 - Hồ Chí Minh",
            isDefault: false
        ),
    ]
}
