//
//  KPS_ImageSlider.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ImageSliderView: View {
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var index: Int = 0
    var sliders: [ImageModel] = []
    
    var body: some View {
        TabView(selection: $index){
            ForEach(sliders) { sliderImage in
                AsyncImage(url: URL(string: sliderImage.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                        .tint(.accentColor)
                }
                
            }
        }
        .tabViewStyle(.page)
        .frame(height: 185)
        .onReceive(timer) { _ in
            withAnimation {
                index = index < ImageModel.sliders.count ? index + 1 : 0
            }
        }
    }
}

#Preview {
    KPS_ImageSliderView(sliders: ImageModel.sliders)
}
