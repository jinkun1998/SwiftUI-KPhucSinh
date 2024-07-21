//
//  StoreModel.swift
//  KPhucSinh
//
//  Created by Jin on 21/7/24.
//

import Foundation

struct StoreModel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phone: String
    let latitude: Double
    let longitude: Double
    let image: String
    
    static let stores = [
        StoreModel(
            name: "K COFFEE 238 VÕ VĂN KIỆT",
            address: "238-240 Võ Văn Kiệt, Phường Cầu Ông Lãnh, Quận 1, TP.HCM",
            phone: "028 3920 8388",
            latitude: 10.76314518631754,
            longitude: 106.69709856312434,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/238-7.jpg"
        ),
        StoreModel(
            name: "K COFFEE HAI BÀ TRƯNG",
            address: "135 Hai Bà Trưng, Phường Bến Nghé, Quận 1, TP.HCM",
            phone: "028 3636 0653",
            latitude: 10.782451236323967,
            longitude: 106.69837865065891,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/HBT-1.jpg"
        ),
        StoreModel(
            name: "K COFFEE 246 VÕ VĂN KIỆT",
            address: "246-248 Võ Văn Kiệt, Phường Cầu Ông Lãnh, Quận 1, TP.HCM",
            phone: "028 3836 4018",
            latitude: 10.76314518631754,
            longitude: 106.69709856312434,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/246-6.jpg"
        ),
        StoreModel(
            name: "K COFFEE NGUYỄN THÁI BÌNH",
            address: "156-158 Nguyễn Thái Bình, Phường Nguyễn Thái Bình, Quận 1, TP.HCM",
            phone: "028 3620 4779",
            latitude: 10.767909615541608,
            longitude: 106.69805136316188,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/NTB-12.jpg"
        ),
        StoreModel(
            name: "K COFFEE PHAN XÍCH LONG",
            address: "223 Phan Xích Long, Phường 2, Quận Phú Nhuận, TP.HCM",
            phone: "028 3535 4117",
            latitude: 10.798999420570002,
            longitude: 106.68643280291582,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/PXL-1.jpg"
        ),
        StoreModel(
            name: "K COFFEE PHÚ MỸ HƯNG",
            address: "5 Nội Khu Hưng Phước 4, Phú Mỹ Hưng, Phường Tân Phong, Quận 7, TP.HCM",
            phone: "028 5410 9711",
            latitude: 10.729664420375096,
            longitude: 106.70825961973465,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/PMH-2.jpg"
        ),
        StoreModel(
            name: "K COFFEE ĐÀO TRÍ",
            address: "Số 4 đường Đào Trí, phường Phú Thuận, Quận 7, Tp.HCM (Lô ABL1-05, Tầng trệt TTTM Q7 Saigon Riverside Complex)",
            phone: "1900 558 808",
            latitude: 10.721579395971682,
            longitude: 106.74279459670097,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/DT-2.jpg"
        ),
        StoreModel(
            name: "K COFFEE NGUYỄN HỮU THỌ",
            address: "G1-10, Novaland Sunrise Riverside, Nguyễn Hữu Thọ, Phước Kiển, Nhà Bè, TP.HCM (Genshai Mart)",
            phone: "1900 558 808",
            latitude: 10.723193200650444,
            longitude: 106.70393741083227,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/NHT-BS-1.jpg"
        ),
        StoreModel(
            name: "K COFFEE NGUYỄN ẢNH THỦ",
            address: "167/2 Nguyễn Ảnh Thủ, phường Trung Mỹ Tây, Quận 12, TP.HCM (Coopmart Nguyễn Ảnh Thủ)",
            phone: "089 8419 736",
            latitude: 10.857493840985446,
            longitude: 106.60879542553691,
            image: "https://cdn.kphucsinh.vn/Media/HE-THONG-K-COFFEE/Mattien-NAT-1360x1000px-1.jpg"
        )
    ]
}
