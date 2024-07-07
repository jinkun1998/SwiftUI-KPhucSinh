//
//  SliderImage.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import Foundation

struct ImageModel : Identifiable{
    
    let id:Int
    let url:String
    
    static let sliders = [
        ImageModel(id: 1, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/1920x901px-BSL-Set.jpg"),
        ImageModel(id: 2, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/1920x901px-Cascara-Set.jpg"),
        ImageModel(id: 3, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/1920x901px-DELIGHT-Set.jpg"),
        ImageModel(id: 4, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/Slider-K-COFFEE-1800x1302.jpg"),
        ImageModel(id: 5, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/Slider-HLB-1800x1302.jpg"),
        ImageModel(id: 6, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/Slider-FSB-1800x1302.jpg"),
        ImageModel(id: 7, url: "https://cdn.kphucsinh.vn/Media/06.2024-Banner-&-Slider/Slider-Filter-Coffee-1800x1302.jpg")
    ]
    
    static let flashSale = ImageModel(id: 1, url: "https://cdn.kphucsinh.vn/Media/Banner%20Flash%20Sale/Flash%20Sale%20Banner.jpg")
}
