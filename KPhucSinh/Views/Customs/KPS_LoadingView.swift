//
//  KPS_CustomLoadingView.swift
//  KPhucSinh
//
//  Created by Jin on 29/9/24.
//

import SwiftUI

struct KPS_LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack{
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundStyle(Consts.primaryColor)
                    .controlSize(.large)
                
                Text("Đang tải...")
                    .font(.title3)
                    .foregroundStyle(Consts.primaryColor)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .fill(Consts.primaryColor)
                    .frame(width: 250, height: 150)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    KPS_LoadingView()
}
