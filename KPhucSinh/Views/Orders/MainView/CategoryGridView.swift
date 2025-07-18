//
//  KPS_CategoryView.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import SwiftUI

struct CategoryGridView: View {
    
    private let gridItems = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var categories: [CategoryModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(categories) { category in
                    VStack {
                        KPS_ImageView(url: category.imageURL)
                            .frame(width: 30, height: 30)
                        
                        Text(category.name.uppercased())
                            .font(Font.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(category.isNew ? Color("ProductBadgeColor") : .accentColor)
                            .lineLimit(1)
                    }
                    .frame(height: 60)
                    .containerRelativeFrame(.horizontal,
                                            count: UIDevice.current.userInterfaceIdiom == .phone ? 4 : 5,
                                            spacing: 15)
                }
            }
            .scrollTargetLayout()
        }
        .padding(5)
        .contentMargins(20, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    CategoryGridView(categories: CategoryModel.categories)
}
