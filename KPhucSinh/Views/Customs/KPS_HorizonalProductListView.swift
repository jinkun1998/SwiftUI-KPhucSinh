//
//  KPS_HorizonalItemListView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_HorizonalProductListView: View {
    
    var products: [ProductModel]
    var isFlashSale: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack(spacing: 0) {
                    
                    if (isFlashSale) {
                        KPS_FlashSaleProductView(product: products.first!)
                    }
                    
                    HStack(alignment: .bottom) {
                        ForEach(ProductModel.products) { product in
                            
                            if (ProductModel.products.firstIndex{$0.id == product.id} != 0){
                                KPS_ProductView(product: product)
                            }
                            
                            Divider()
                        }
                    }
                    .overlay(alignment: .topLeading) {
                        if (isFlashSale){
                            Text("FLASH SALES")
                                .font(.title)
                                .bold()
                                .foregroundColor(Color("ProductBadgeColor"))
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                        }
                    }
                }
            }
            .contentMargins(10, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .frame(height: isFlashSale ? 310 : 250)
        }
    }
}

#Preview {
    KPS_HorizonalProductListView(products: ProductModel.products, isFlashSale: false)
}
