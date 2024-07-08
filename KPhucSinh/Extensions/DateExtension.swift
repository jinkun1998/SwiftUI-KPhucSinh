//
//  DateExtension.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import Foundation

extension Date{
    
    static func fromTimeInterval(_ timeInterval: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: timeInterval - getPochTimeInterval())
    }
    
    func getComponent(component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        return calendar.component(component, from: self)
    }
    
    static func getTimeInterval(component: Calendar.Component) -> TimeInterval {
        switch component {
        case .second:
            return 1
        case .minute:
            return getTimeInterval(component: .second) * 60
        case .hour:
            return getTimeInterval(component: .minute) * 60
        case .day:
            return getTimeInterval(component: .hour) * 24
        @unknown default:
            return 0
        }
    }
    
    static func getPochTimeInterval() -> TimeInterval {
        return getTimeInterval(component: .day) + (getTimeInterval(component: .hour) * 8)
    }
}
