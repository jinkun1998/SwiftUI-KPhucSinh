//
//  KPS.SearchBar.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
            
            TextField(text: $searchText) {
                Text("Tìm kiếm sản phẩm...")
                    .font(.callout)
                    .foregroundColor(Color.secondary)
                    .italic()
            }
        }
        .padding(10)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(.background)
                .shadow(color: .black.opacity(0.2), radius: 5)
        )
    }
}

#Preview {
    KPS_SearchBarView(searchText: .constant("Hello"))
}
