//
//  KPS_AlertView.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import SwiftUI

struct KPS_AlertView: View {
    
    var title: String
    var message: String
    var submitTitle: String = ""
    var submitAction: () -> Void = {}
    var cancelTitle: String = ""
    var cancelAction: () -> Void = {}
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .tint(.black)
                .opacity(0.2)
            
            VStack(spacing: 20) {
                
                // title
                Text(title)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                
                Divider()
                
                // message
                Text(message)
                    .font(.body)
                    .foregroundColor(.accentColor)
                
                Divider()
                
                if (!submitTitle.isEmpty) {
                    Button {
                        print("ok")
                        submitAction()
                    } label: {
                        Text(submitTitle)
                    }
                    .frame(height: .infinity)
                }
                
                if (!cancelTitle.isEmpty) {
                    Button {
                        print("cancel")
                        cancelAction()
                    } label: {
                        Text(cancelTitle)
                    }
                    .frame(height: .infinity)
                }
            }
            .padding(20 )
            .frame(width: .infinity, height: .infinity)
            .background(content: {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .shadow(radius: 10)
            })
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    KPS_AlertView(
        title: "Thông báo",
        message: "Giỏ hàng của bạn đang rỗng.",
        submitTitle: "ok",
        submitAction: { },
        cancelTitle: "cancel",
        cancelAction: { }
    )
}
