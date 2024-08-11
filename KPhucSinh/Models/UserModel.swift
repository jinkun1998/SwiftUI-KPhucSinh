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
    let createdDate: TimeInterval
}
