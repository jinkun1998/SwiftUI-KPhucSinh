//
//  KPS_ImageSlider.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ImageSliderView: View {
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var sliders: [ImageModel] = []
    var aspectRatio: ContentMode
    var indexDisplayMode: PageTabViewStyle.IndexDisplayMode
    var width: CGFloat = .infinity
    var height: CGFloat = .infinity
    @Binding var index: Int
    
    var body: some View {
        TabView(selection: $index){
            ForEach(sliders) { sliderImage in
                KPS_ImageView(url: sliderImage.url, aspectRatio: aspectRatio)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: indexDisplayMode))
        .frame(width: width, height: height)
        .onReceive(timer) { _ in
            withAnimation {
                index = index < ImageModel.sliders.count ? index + 1 : 0
            }
        }
    }
}

#Preview {
    KPS_ImageSliderView(
        sliders: ImageModel.sliders,
        aspectRatio: .fill,
        indexDisplayMode: .automatic,
        height: UIDevice.current.userInterfaceIdiom == .phone ? 185 : 285,
        index: .constant(0)
    )
}
