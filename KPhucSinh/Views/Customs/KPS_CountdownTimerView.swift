//
//  KPS_CountdownTimerView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_CountdownTimerView: View {
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var date: Date
    var component: Calendar.Component
    var componentName: String
    
    var body: some View {
        VStack(spacing: 10) {
            // countdown
            Text("\(date.getComponent(component: component))")
                .foregroundColor(.accentColor)
                .font(Font.system(size: 12))
                .bold()
                .background(
                    Circle()
                        .fill(.placeholder)
                        .frame(width: 23, height: 23)
                )
            
            // description
            Text(componentName)
                .foregroundColor(.gray)
                .font(Font.system(size: 12))
                .italic()
        }
        .onReceive(timer) { _ in
            withAnimation {
                date = date.addingTimeInterval(-1)
            }
        }
    }
}

#Preview {
    HStack{
        let date = Date(timeIntervalSinceNow: Date.getTimeInterval(component: .day))
        
        KPS_CountdownTimerView(date: date, component: .year, componentName: "Ngày")
        KPS_CountdownTimerView(date: date,component: .hour, componentName: "Giờ")
        KPS_CountdownTimerView(date: date,component: .minute, componentName: "Phút")
        KPS_CountdownTimerView(date: date,component: .second, componentName: "Giây")
    }
    .padding(15)
}
