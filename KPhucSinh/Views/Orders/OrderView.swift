//
//  OrderView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct OrderView: View {
    
    @State private var searchText: String = ""
    @State private var isShowProductQuickView: Bool = false
    @State private var isShowAddedToCartPopup: Bool = false
    @State private var quantity: Int = 1

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
                
                HStack{
                    
                    Text("1")
                        .foregroundColor(.white)
                        .background {
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 2))
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        .offset(x: 30)
                    
                    Spacer()
                    
                    Text("GIỎ HÀNG")
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer()
                }
                .background {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 25, topTrailing: 25))
                        .foregroundColor(.accentColor)
                        .frame(height: 55)
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 15, trailing: 5))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isShowProductQuickView = true
                        isShowAddedToCartPopup = false
                    }
                }
            }
            
            if (!searchText.isEmpty){
                KPS_SearchBarView(searchText: $searchText)
                
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
        .simultaneousGesture(TapGesture().onEnded() {
            withAnimation(.easeInOut(duration: 0.2)) {
                searchText = ""
                isShowProductQuickView = false
                isShowAddedToCartPopup = false
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        })
        .blur(radius: isShowProductQuickView || isShowAddedToCartPopup ? 10 : 0)
        .overlay(alignment: .bottom) {
            if (isShowProductQuickView) {
                ProductQuickView(
                    product: ProductModel.product,
                    quantity: $quantity,
                    animationDuration: 0.2,
                    isShow: $isShowProductQuickView,
                    isShowAddedToCartPopup: $isShowAddedToCartPopup
                )
            }
            
            if (isShowAddedToCartPopup) {
                AddedProductToCartPopupView(
                    product: ProductModel.product,
                    quantity: quantity,
                    animationDuration: 0.2,
                    isShow: $isShowAddedToCartPopup
                )
            }
        }
    }
}

#Preview {
    OrderView()
}
