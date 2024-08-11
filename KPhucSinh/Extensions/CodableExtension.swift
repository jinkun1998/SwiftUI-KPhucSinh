//
//  CodableExtension.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String:String] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let dict = try JSONSerialization.jsonObject(with: data) as? [String: String]
            return dict ?? [:]
        }
        catch {
            return [:]
        }
    }
}
