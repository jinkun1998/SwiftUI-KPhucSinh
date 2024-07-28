//
//  KPS_DefaultAddressShape.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import SwiftUI

struct KPS_DefaultAddressShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let pointA = CGPoint(x: rect.width * 0.05, y: rect.minY)
        let pointB = CGPoint(x: rect.maxX, y: rect.minY)
        let pointC = CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.5)
        let pointD = CGPoint(x: rect.maxX, y: rect.maxY)
        let pointE = CGPoint(x: rect.minX, y: rect.maxY)
        
        path.move(to: pointA)
        path.addLine(to: pointB)
        path.addLine(to: pointC)
        path.addLine(to: pointD)
        path.addLine(to: pointE)
        path.addLine(to: pointA)
        
        return path
    }
}

#Preview {
    KPS_DefaultAddressShape()
        .fill(Consts.primaryColor)
        .frame(width: 300, height: 50)
        
}
