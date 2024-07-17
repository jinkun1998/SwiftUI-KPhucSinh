//
//  KPS_HorizonalItemListView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct HorizonalProductListView: View {
    
    var products: [ProductModel]
    var isFlashSale: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0) {
                
                if (isFlashSale) {
                    NavigationLink {
                        OrderDetailView(product: products.first!)
                    } label: {
                        KPS_FlashSaleProductView(product: products.first!)
                    }
                }
                
                HStack {
                    ForEach(ProductModel.products) { product in
                        
                        if (ProductModel.products.firstIndex{$0.id == product.id} != 0){
                            NavigationLink {
                                OrderDetailView(product: product)
                            } label: {
                                HStack(alignment: .bottom) {
                                    KPS_ProductView(product: product)
                                        .containerRelativeFrame(.horizontal,
                                                                count: UIDevice.current.userInterfaceIdiom == .phone ? 2 : 4,
                                                                spacing: 0)
                                        .offset(y: isFlashSale ? -15 : 0)
                                    
                                    Divider()
                                }
                            }
                        }
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
                .scrollTargetLayout()
            }
        }
        .frame(height: isFlashSale ? 290 : 250)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    HorizonalProductListView(products: ProductModel.products, isFlashSale: false)
}
