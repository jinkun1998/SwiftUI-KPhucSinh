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
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
                .tint(.accentColor)
        }
        .frame(height: 75)
    }
}

#Preview {
    KPS_ImageBannerView(imageURL: ImageModel.flashSale.url)
}
