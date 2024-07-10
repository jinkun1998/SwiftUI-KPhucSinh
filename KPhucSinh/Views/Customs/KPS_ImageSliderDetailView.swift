//
//  KPS_ImageSlider.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ImageSliderDetailView: View {
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var index: Int = 0
    var sliders: [ImageModel] = []
    
    var body: some View {
        VStack {
            KPS_ImageSliderView(
                sliders: sliders,
                aspectRatio: .fit,
                indexDisplayMode: .never,
                height: 400,
                index: $index
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sliders) { slider in
                        KPS_ImageView(url: slider.url, aspectRatio: .fill)
                            .frame(width: 80, height: 80)
                            .overlay(alignment: .center, content: {
                                if (index == sliders.firstIndex(where: {$0.id == slider.id})!) {
                                    Rectangle()
                                        .stroke(style: StrokeStyle(lineWidth: 3.5))
                                        .foregroundColor(.gray)
                                }
                            })
                            .onTapGesture {
                                withAnimation(.linear(duration: 5)) {
                                    index = sliders.firstIndex(where: {$0.id == slider.id})!
                                }
                            }
                    }
                }
                .padding(5)
            }
        }
    }
}

#Preview {
    KPS_ImageSliderDetailView(sliders: ProductModel.product.images)
}
