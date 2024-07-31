//
//  CheckboxModel.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import Foundation

struct CheckboxModel: Identifiable, Hashable {
    let id: Int
    var title: String
    var isChecked: Bool
    var iconURL: String = ""
}
