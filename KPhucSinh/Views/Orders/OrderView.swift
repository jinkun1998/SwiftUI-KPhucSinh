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
        VStack{
            // search bar
            KPS_SearchBarView(searchText: $searchText)
                .padding(10)
            
            ScrollView{
                // slider
                KPS_ImageSliderView(sliders: ImageModel.sliders)
                
                // flashsale image
                KPS_ImageBannerView(imageURL: ImageModel.flashSale.url)
                
                // flashsale items
                KPS_HorizonalProductListView(products: ProductModel.products)
            }
        }
    }
}

#Preview {
    OrderView()
}
