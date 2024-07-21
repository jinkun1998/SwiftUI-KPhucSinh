//
//  OrderModel.swift
//  KPhucSinh
//
//  Created by Jin on 20/7/24.
//

import Foundation

final class OrderEnvironmentViewModel: ObservableObject {
    
    @Published private var selectedProduct: ProductModel?
    @Published var cartItems: [CartModel] = []
    
    @Published var isShowProductQuickView: Bool = false
    @Published var isShowAddedToCartPopup: Bool = false
    
    func getCartCount() -> Int {
        return cartItems.reduce(0) { result, cart in
            return result + cart.quantity
        }
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
        
        
        if let cartItem = cartItems.first(where: {$0.id == product.id}) {
            plusProductQuantity(cart: cartItem, quantity: quantity)
        }
        else {
            let newCartItem = CartModel(product: product, quantity: quantity)
            cartItems.append(newCartItem)
        }
    }
    
    func removeFromCart(_ index: Int) {
        
        guard index < getCartCount() else {
            return
        }
        
        cartItems.remove(at: index)
    }
    
    func clearCartItems() {
        cartItems.removeAll()
    }
    
    func minusProductQuantity(cart: CartModel, quantity: Int = 1) {
        guard var existProduct = cartItems.first(where: {$0.id == cart.id}) else { return }
        
        existProduct.quantity -= quantity
        if (existProduct.quantity == 0) {
            removeFromCart(cartItems.firstIndex(where: {$0.id == existProduct.id})!)
        }
        
        cartItems = cartItems.map({$0.id == existProduct.id ? existProduct : $0})
    }
    
    func plusProductQuantity(cart: CartModel, quantity: Int = 1) {
        guard var existProduct = cartItems.first(where: {$0.id == cart.id}) else { return }
        
        existProduct.quantity += quantity
        cartItems = cartItems.map({$0.id == existProduct.id ? existProduct : $0})
    }
    
    func getCartTotal() -> [Double] {
        let totalPrice = cartItems.reduce(0) { partialResult, cart in
            return partialResult + cart.unitPrice
        }
        
        return [totalPrice, totalPrice / Consts.dividedThousands, totalPrice.truncatingRemainder(dividingBy: Consts.dividedThousands)]
    }
}

enum PopupType {
    case none
    case productQuickView
    case addedToCart
}
