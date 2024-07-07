//
//  Product.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import Foundation

struct ProductModel: Identifiable{
    let id: Int
    let name: String
    let weight: String
    let price: Double
    let priceAfterDevide100: Double
    let description: String
    let images: [ImageModel]
    
    static let product = ProductModel(
        id: 1,
        name: "HỘP TRÀ CASCARA BLUE SƠN LA CAO CẤP - 112.5G (CÓ HỘP QUÀ ĐI KÈM)",
        weight: "112,5 Gram",
        price: 219,
        priceAfterDevide100: 999,
        description: """
TRÀ CASCARA cao cấp Blue Sơn La Specialty được mệnh danh là “cherry” của vùng đồi núi Tây Bắc Việt Nam.
Bộ sản phẩm bao gồm: Hộp đựng cao cấp, sang trọng & Hộp thiếc trà túi lọc Cascara 112,5g

Ở vùng núi Tây Bắc Sơn La hùng vĩ, Việt Nam. Nơi thiên nhiên và truyền thống hội tụ bốn mùa khác biệt. Giữa núi rừng cổ kính và sương mù huyền ảo, những vườn cà phê đâm chồi nảy lộc dưới bàn tay chăm sóc của những người nông dân tâm huyết đã nuôi dưỡng mùa màng của mình với niềm đam mê lớn lao.

Cascara Blue Son La được lựa chọn 100% trái cà phê chín đỏ với công nghệ Colombia chúng tôi giữ nguyên mật ngọt trái cà phê làm cho vị Cascara luôn khác biệt và hấp dẫn. Khi bạn nhâm nhi Cascara Blue Son La, bạn không chỉ tham gia vào một di sản, bạn sẽ tìm thấy Cascara trái cây, pha chút vị chua, hương vị núi rừng Tây Bắc. Gợi nhớ đến không khí miền núi trong lành, sương mù giăng lối và nét đất tinh tế của địa hình. Hậu vị Cascara mang lại cảm giác thanh sạch, tươi mát, dịu dàng.

CÔNG DỤNG
- Có chất chống oxy hóa cao, giúp làn da thêm mịn màng
- Hỗ trợ cải thiện hệ tiêu hóa
- Hỗ trợ giữ cân nặng hợp lý, vóc dáng đẹp.

CAM KẾT
- 100% VỎ CÀ PHÊ ARABICA CHÍN ĐỎ
- KHÔNG MÀU HÓA HỌC
- KHÔNG MÙI GÂY HẠI

CHỨNG NHẬN
- Là hương hiệu duy nhất tại Việt Nam đạt chứng nhận UTZ & BRC toàn cầu
- Sản phẩm được sản xuất theo quy tình khép kín đạt tiêu chuẩn quốc tế

THÔNG TIN MUA HÀNG
Để mua sản phẩm Trà Cascara Blue Sơn La chính hãng Quý khách có thể mua trực tuyến tại Kphucsinh.vn
Gọi trực tiếp vào số hotline: 0911 197 705
Chat tư vấn trực tiếp trên FANPAGE K COFFEE https://www.facebook.com/KcoffeePhucSinh
""",
        images: [
            ImageModel(id: 1, url: "https://cdn.kphucsinh.vn/Media/Anh-SP-06.2024/FINAL-Cascara-GB-1125.jpg"),
            ImageModel(id: 2, url: "https://cdn.kphucsinh.vn/Media/CTKM-06.2024/Artboard-1-copy-25-100.jpg"),
            ImageModel(id: 3, url: "https://cdn.kphucsinh.vn/Media/12.2023/z5219008971093-f8be9a9fe8a2bc3d7f794c686fdaabf1.jpg"),
            ImageModel(id: 4, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/01-Cascara-Gift-Box-112-1.jpg"),
            ImageModel(id: 5, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/02-Cascara-Gift-Box-112.jpg"),
            ImageModel(id: 6, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/hop-qua-cascara-112-5.jpg"),
            ImageModel(id: 7, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/Cascara-Tin-Gift-Box-112.jpg"),
            ImageModel(id: 8, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/z4991497318873-dbeb243ce18faaa4718fd207f3c699a8.jpg"),
            ImageModel(id: 9, url: "https://cdn.kphucsinh.vn/Media/Tra-cascara/z4991497324948-9f6491ebc64f18e084a1344c7170d3d3.jpg")
        ]
    )
    
    static let products: [ProductModel] = [
        ProductModel.product,
        ProductModel.product,
        ProductModel.product,
        ProductModel.product,
        ProductModel.product,
    ]
}
