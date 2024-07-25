//
//  OrderView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject private var order: OrderEnvironmentViewModel
    
    @State private var searchText: String = ""
    @State private var index: Int = 0
    
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
                        index: $index
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
                
                if (order.getCartCount() > 0) {
                    NavigationLink {
                        OrderCartView()
                    } label: {
                        HStack{
                            
                            Text("\(order.getCartCount())")
                                .foregroundColor(.white)
                                .padding(2)
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
                            
                            KPS_PriceView(
                                price: order.getCartTotal()[1],
                                priceAfterDevide100: order.getCartTotal()[2],
                                foregroundColor: .white
                            )
                            .offset(x: -10)
                        }
                        .background {
                            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 25, topTrailing: 25))
                                .foregroundColor(.accentColor)
                                .frame(height: 55)
                        }
                        .padding(.bottom, 15)
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
        .blur(radius: order.canShowPopup(.addedToCart) || order.canShowPopup(.productQuickView) ? 10 : 0)
        .simultaneousGesture(TapGesture().onEnded() {
            withAnimation(.easeInOut(duration: Consts.animationDuration)) {
                searchText = ""
                order.resetSelectedProduct()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        })
    }
}

#Preview {
    OrderView()
}
