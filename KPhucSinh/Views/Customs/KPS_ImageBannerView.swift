//
//  KPS_ImageBanner.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct KPS_ImageBannerView: View {
    
    @State var imageURL: String
    
    var body: some View {
        KPS_ImageView(url: imageURL, aspectRatio: .fill)
            .frame(height: UIDevice.current.userInterfaceIdiom == .phone ? 90 : 210)
    }
}

#Preview {
    KPS_ImageBannerView(imageURL: ImageModel.flashSale.url)
}
