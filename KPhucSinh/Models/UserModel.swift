//
//  UserModel.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation

struct UserModel: Codable {
    var fullName: String
    var phone: String
    var email: String
    var avatar: String
    var isReceivePromotion: Bool
    var birthDate: TimeInterval
    var gender: Int
    var city: Int?
    var district: Int?
    var ward: Int?
    var address: String
    let createdDate: TimeInterval
}
