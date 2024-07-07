//
//  KPS_CountdownTimerView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_CountdownTimerView: View {
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let calendar = Calendar.current
    private let fromToday = Date().addingTimeInterval(84600)
    @State private var date: Date = Date()
//    @State private var date: Date = Date(timeIntervalSinceNow: 426599)
    @State var component: Calendar.Component
    @State var componentName: String
    
    var body: some View {
        VStack(spacing: 10) {
            // countdown
            Text("\(calendar.component(component, from: fromToday))")
                .foregroundColor(.accentColor)
                .font(.headline)
                .bold()
                .background(
                    Circle()
                        .fill(.placeholder)
                        .frame(width: 30, height: 30)
                )
            
            // description
            Text(componentName)
                .foregroundColor(.gray)
                .font(.caption)
                .italic()
        }
        .onReceive(timer) { _ in
            withAnimation {
                date = fromToday.addingTimeInterval(-1)
            }
        }
    }
}

#Preview {
    HStack{
        KPS_CountdownTimerView(component: .day, componentName: "Ngày")
        KPS_CountdownTimerView(component: .hour, componentName: "Ngày")
        KPS_CountdownTimerView(component: .minute, componentName: "Ngày")
        KPS_CountdownTimerView(component: .second, componentName: "Ngày")
    }
}
