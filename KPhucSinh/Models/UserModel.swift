//
//  UserModel.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation

struct UserModel: Codable {
    let fullName: String
    let phone: String
    let email: String
    let avatar: String
    let isReceivePromotion: Bool
    let birthDate: TimeInterval
    let gender: Int
    let city: Int
    let district: Int
    let ward: Int
    let address: String
    let createdDate: TimeInterval
}
