//
//  BadgeModel.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import Foundation

struct BadgeModel{
    let name: String
    let isSale: Bool
    
    static let badges = [
        BadgeModel(name: "Mua 1 tặng 1", isSale: false),
        BadgeModel(name: "Sale 10%", isSale: true)
    ]
}
