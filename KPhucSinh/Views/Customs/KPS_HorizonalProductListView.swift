//
//  KPS_HorizonalItemListView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_HorizonalProductListView: View {
    
    @State var products: [ProductModel]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 0) {
                ForEach(ProductModel.products) { product in
                    KPS_ProductView(product: product)
                    
                    Divider()
                }
            }
        }
        .contentMargins(10, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .frame(height: 250)
    }
}

#Preview {
    KPS_HorizonalProductListView(products: ProductModel.products)
}
