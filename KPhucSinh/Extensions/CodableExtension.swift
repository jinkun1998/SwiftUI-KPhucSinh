//
//  CodableExtension.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return dict ?? [:]
        }
        catch {
            return [:]
        }
    }
}
