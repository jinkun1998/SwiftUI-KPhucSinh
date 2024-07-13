//
//  KPS_ImageSlider.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ImageSliderDetailView: View {
    
    @State private var index: Int = 0
    var sliders: [ImageModel] = []
    
    var body: some View {
        VStack {
            KPS_ImageSliderView(
                sliders: sliders,
                aspectRatio: .fit,
                indexDisplayMode: .never,
                height: 300,
                index: $index
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack {
                        ForEach(sliders) { slider in
                            KPS_ImageView(url: slider.url, aspectRatio: .fill)
                                .frame(width: 50, height: 50)
                                .padding(7)
                                .overlay(alignment: .center, content: {
                                    if (index == sliders.firstIndex(where: {$0.id == slider.id})!) {
                                        Rectangle()
                                            .stroke(style: StrokeStyle(lineWidth: 4))
                                            .foregroundColor(.gray)
                                            .onAppear {
                                                withAnimation {
                                                    proxy.scrollTo(index, anchor: .center)
                                                }
                                            }
                                    }
                                })
                                .onTapGesture {
                                    withAnimation(.default) {
                                        index = sliders.firstIndex(where: {$0.id == slider.id})!
                                    }
                                }
                                .containerRelativeFrame(.horizontal, count: 6, spacing: 0)
                                .id(slider.id)
                        }
                    }
                    .padding(0)
                    .scrollTargetLayout()
                }
            }
        }
        .scrollTargetBehavior(ViewAlignedScrollTargetBehavior())
    }
}

#Preview {
    KPS_ImageSliderDetailView(sliders: ProductModel.product.images)
}
