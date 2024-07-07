//
//  KPS.SearchBar.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_SearchBarView: View {
    
    @Binding var searchText: String
    @FocusState var searchBarFocusState: SearchBarFocusState?
    
    enum SearchBarFocusState{
        case active
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 15){
                Image(systemName: "magnifyingglass")
                
                TextField(text: $searchText) {
                    Text("Tìm kiếm sản phẩm...")
                        .font(.callout)
                        .foregroundColor(.accentColor)
                        .italic()
                }
                .focused($searchBarFocusState, equals: .active)
                
                if (searchBarFocusState == .active){
                    Button("Tìm", action: {
                        print("searching")
                    })
                }
            }
            .padding(10)
            .frame(height: 50)
            
 
            
            if (searchBarFocusState == .active){
                Divider()
                
                List{
                    ForEach(ProductModel.products){product in
                        Text(product.name)
                            .lineLimit(1)
                            .foregroundColor(.accentColor)
                    }
                    
                }
                .frame(height: 300)
                .listStyle(.plain)
            }
        }
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
