//
//  CategoryModel.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import Foundation

struct CategoryModel: Identifiable{
    let id: Int
    let name: String
    let imageURL: String
    let isNew: Bool
    
    static let categories = [
        CategoryModel(id: 1, name: "Sản phẩm mới", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/new.png", isNew: true),
        CategoryModel(id: 2, name: "Giftset", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%205%402x.png", isNew: false),
        CategoryModel(id: 3, name: "Trà Cascara", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%203%402x.png", isNew: false),
        CategoryModel(id: 4, name: "Phụ kiện", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%207%402x.png", isNew: false),
        CategoryModel(id: 5, name: "Nguyên liệu", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/IconNguyenLieu.png", isNew: false),
        CategoryModel(id: 6, name: "Cà phê", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%201%402x.png", isNew: false),
        CategoryModel(id: 7, name: "Tiêu", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%204%402x.png", isNew: false),
        CategoryModel(id: 8, name: "Thiết bị", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%208%402x.png", isNew: false),
        CategoryModel(id: 9, name: "Sách", imageURL: "https://cdn.kphucsinh.vn/Media/Menu%20Icon/Asset%206%402x.png", isNew: false)
    ]
}
