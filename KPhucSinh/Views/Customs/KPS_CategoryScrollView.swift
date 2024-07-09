//
//  KPS_CategoryScrollView.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import SwiftUI

struct KPS_CategoryScrollView: View {
    
    var name: String
    var categories: [CategoryModel] = []
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(name.uppercased())
                .font(.callout)
                .foregroundColor(.accentColor)
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(categories) { category in
                        
                        Text(category.name)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Divider()
                    }
                }
            }
            
            Button {
                print("see all")
            } label: {
                Text("»")
                    .font(.title)
                    .bold()
                    .frame(width: 30)
                    .offset(y: 5)
            }
        }
        .frame(height: 20)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        .padding()
    }
}

#Preview {
    KPS_CategoryScrollView(name: "SẢN PHẨM NỔI BẬT", categories: CategoryModel.categories)
}
