//
//  SectionModel.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import Foundation

struct SectionModel: Identifiable{
    let id = UUID()
    let name: String
    var imageURL: String = ""
    var categories: [CategoryModel] = []
    var products: [ProductModel] = []
    
    static let sections = [
        SectionModel(name: "sản phẩm nổi bật", products: ProductModel.products),
        SectionModel(name: "cà phê", imageURL: ImageModel.coffee.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "tiêu", imageURL: ImageModel.pepper.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "gift set", imageURL: ImageModel.giftSet.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "trà cascara", imageURL: ImageModel.cascaraTea.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "phụ kiện", imageURL: ImageModel.accessories.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "sách", imageURL: ImageModel.book.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "thiết bị", imageURL: ImageModel.equipment.url, categories: CategoryModel.categories, products: ProductModel.products),
        SectionModel(name: "nguyên liệu", imageURL: ImageModel.material.url, categories: CategoryModel.categories, products: ProductModel.products)
    ]
}
