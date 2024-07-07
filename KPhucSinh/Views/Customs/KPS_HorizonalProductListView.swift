//
//  KPS_HorizonalItemListView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_HorizonalProductListView: View {
    
    @State var products: [ProductModel]
    @State var isFlashSale: Bool
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 0) {
                ForEach(ProductModel.products) { product in
                    if (isFlashSale && products.firstIndex{$0.id == product.id} == 0) {
                        KPS_FlashSaleProductView(product: product)
                    }
                    else{
                        KPS_ProductView(product: product)
                    }
                    
                    Divider()
                }
            }
        }
        .contentMargins(10, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .frame(height: isFlashSale ? 350 : 250)
    }
}

#Preview {
    KPS_HorizonalProductListView(products: ProductModel.products, isFlashSale: true)
}
