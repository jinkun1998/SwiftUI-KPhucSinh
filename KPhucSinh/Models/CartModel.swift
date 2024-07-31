//
//  Product.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import Foundation

struct CartModel: Identifiable, Hashable {
    let id: UUID
    let name: String
    let weight: String
    let unitPrice: Double
    let price: Double
    let priceAfterDevide1000: Double
    let images: [ImageModel]
    var quantity: Int
    
    init(product: ProductModel, quantity: Int) {
        id = product.id
        name = product.name
        images = product.images
        weight = product.weight
        unitPrice = product.unitPrice
        price = product.price
        priceAfterDevide1000 = product.priceAfterDevide1000
        self.quantity = quantity
    }
}
