//
//  StoreCardView.swift
//  KPhucSinh
//
//  Created by Jin on 21/7/24.
//

import SwiftUI

struct StoreCardView: View {
    
    var store: StoreModel
    
    var body: some View {
        VStack(spacing: 20) {
            KPS_ImageView(url: store.image, aspectRatio: .fill)
                .frame(height: 100)
            
            Spacer()
            
            VStack(spacing: 5) {
                Text(store.name)
                    .font(.callout)
                    .foregroundColor(.accentColor)
                    .bold()
                
                Text(store.address)
                    .font(Font.system(size: 14))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Text(store.phone)
                    .font(Font.system(size: 14))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Button {
                    let url = URL(string: "maps://?saddr=&daddr=\(store.latitude),\(store.longitude)")
                    
                    if (UIApplication.shared.canOpenURL(url!)) {
                        UIApplication.shared.open(url!)
                    }
                    
                    print("navigating to...\(store.name)")
                } label: {
                    Text("Chỉ đường")
                        .font(Font.system(size: 14))
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(height: 120)
        }
        .padding(.bottom, 5)
        .frame(width: 240, height: 280)
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    StoreCardView(store: StoreModel.stores.first!)
}
