//
//  LocationModels.swift
//  KPhucSinh
//
//  Created by Jin on 2/11/24.
//

import Foundation

struct BaseLocationResponse<T> : Decodable where T : Decodable {
    let code: String
    let total: Int
//    let message: String
    let data: [T]
}


struct ProvinceInfoResponse : Decodable {
    let id: String
    let name: String
    let type: Int
    let typeText: String
    let slug: String
}

struct DistrictInfoResponse : Decodable {
    let id: String
    let name: String
    let type: Int
    let typeText: String
    let provinceId: String
}

struct WardInfoResponse : Decodable {
    let id: String
    let name: String
    let type: Int
    let typeText: String
    let districtId: String
}

