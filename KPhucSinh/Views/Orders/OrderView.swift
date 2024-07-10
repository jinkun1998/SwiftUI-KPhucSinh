//
//  OrderView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct OrderView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack{
                // search bar
                KPS_SearchBarView(searchText: $searchText)
                
                ScrollView {
                    // slider
                    KPS_ImageSliderView(
                        sliders: ImageModel.sliders,
                        aspectRatio: .fill,
                        indexDisplayMode: .automatic,
                        height: UIDevice.current.userInterfaceIdiom == .phone ? 185 : 285,
                        index: .constant(0)
                    )
                    
                    // category
                    CategoryGridView(categories: CategoryModel.categories)
                    
                    // flashsale image
                    KPS_ImageBannerView(imageURL: ImageModel.flashSale.url)
                    
                    // flashsale items
                    HorizonalProductListView(products: ProductModel.products, isFlashSale: true)
                    
                    ForEach(SectionModel.sections) { section in
                        if (!section.products.isEmpty){
                            KPS_CategoryScrollView(name: section.name, categories: section.categories)
                            
                            if (!section.imageURL.isEmpty){
                                KPS_ImageBannerView(imageURL: section.imageURL)
                            }
                            
                            HorizonalProductListView(products: ProductModel.products)
                        }
                    }
                }
                .blur(radius: !searchText.isEmpty ? 5 : 0)
            }
            
            if (!searchText.isEmpty){
                List{
                    ForEach(ProductModel.products){product in
                        Text(product.name)
                            .lineLimit(1)
                            .foregroundColor(.accentColor)
                    }
                    
                }
                .frame(height: 300)
                .listStyle(.plain)
                .offset(y: 55)
                .padding(10)
            }
        }
    }
}

#Preview {
    OrderView()
}
