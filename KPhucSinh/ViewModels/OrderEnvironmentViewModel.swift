//
//  OrderModel.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import Foundation

final class OrderEnvironmentViewModel: ObservableObject {
    
    @Published private var selectedProduct: ProductModel?
    @Published private var cartItems: [CartModel] = []
    
    @Published var isShowProductQuickView: Bool = false
    @Published var isShowAddedToCartPopup: Bool = false
    
    func getCartCount() -> Int {
        return cartItems.count
    }
    
    func setSelectedProduct(_ product: ProductModel, _ popupType: PopupType) {
        selectedProduct = product
        
        switch popupType {
        case .addedToCart:
            isShowAddedToCartPopup = true
            isShowProductQuickView = false
        case .productQuickView:
            isShowAddedToCartPopup = false
            isShowProductQuickView = true
        case .none:
            isShowProductQuickView = false
            isShowAddedToCartPopup = false
        }
    }
    
    func getSelectedProduct() -> ProductModel? {
        return selectedProduct
    }
    
    func resetSelectedProduct() {
        isShowProductQuickView = false
        isShowAddedToCartPopup = false
        selectedProduct = nil
    }
    
    func canShowPopup(_ popupType: PopupType) -> Bool {
        
        var isShow = false
        switch popupType {
        case .addedToCart:
            isShow = isShowAddedToCartPopup
        case .productQuickView:
            isShow = isShowProductQuickView
        case .none:
            isShow = false
        }
        
        guard isShow && getSelectedProduct() != nil else { return false }
        return true
    }
    
    func addToCart(product: ProductModel, quantity: Int, showPopup: PopupType) {
        setSelectedProduct(product, showPopup)
        cartItems.append(CartModel(product: product, quantity: quantity))
    }
    
    func removeFromCart(_ index: Int) {
        
        guard index < getCartCount() else {
            return
        }
        
        cartItems.remove(at: index)
    }
}

enum PopupType {
    case none
    case productQuickView
    case addedToCart
}
