//
//  KPS_ImageView.swift
//  KPhucSinh
//
//  Created by Jin on 8/7/24.
//

import SwiftUI

struct KPS_ImageView: View {
    
    var url: String = ""
    var aspectRatio: ContentMode = .fit
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: aspectRatio)
        } placeholder: {
            ProgressView()
                .tint(.accentColor)
        }
    }
}

#Preview {
    KPS_ImageView()
}
