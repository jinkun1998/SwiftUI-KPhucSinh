//
//  OrderPaymentViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import Foundation

@Observable class OrderPaymentViewModel {
    
    // MARK: Receiver info
    var ri_fullName: String = ""
    var ri_phone: String = ""
    var ri_email: String = ""
    var ri_isExportVAT: Bool = false
    var ri_isExpandReceiverInfoSection: Bool = true

    // MARK: Shipping method
    var si_selectedAddress: AddressModel?
    var si_address: String = ""
    var si_shippingMethods = [
        CheckboxModel(id: 1, title: "Nhận hàng tại K SHOP", isChecked: true),
        CheckboxModel(id: 2, title: "Nhận hàng tận nơi", isChecked: false)
    ]
    var si_selectedShippingMethod: CheckboxModel?
    var si_isReceiveAtStore: Bool = false
    var si_isShippingToCustomer: Bool = false
    var si_shippingNote: String = ""
    var si_isExpandShippingMethodSection: Bool = true
    
    func onAddressChange() {
        guard let address = si_selectedAddress else { return }
        
        ri_fullName = address.fullName
        ri_phone = address.phone
        si_address = address.address
    }
    
    func onShippingMethodChange() {
        si_shippingMethods = si_shippingMethods.map({CheckboxModel(id: $0.id, title: $0.title, isChecked: $0.id == pm_selectedPaymentMethod?.id ? true : false, iconURL: $0.iconURL) })
    }
    
    // MARK: Payment method
    var pm_paymentMethods = [
        CheckboxModel(id: 1, title: "Thanh toán khi nhận hàng", isChecked: true),
        CheckboxModel(id: 2, title: "Chuyển khoản ngân hàng", isChecked: false),
        CheckboxModel(id: 3, title: "Thẻ ATM nội địa", isChecked: false),
        CheckboxModel(id: 4, title: "Thẻ tín dụng/ ghi nợ (VISA, MASTER CARD,...)", isChecked: false),
        CheckboxModel(id: 5, title: "Ví MoMo", isChecked: false, iconURL: Consts.momo)
    ]
    var pm_selectedPaymentMethod: CheckboxModel?
    var pm_isCOD: Bool = false
    var pm_isBankTransfer: Bool = false
    var pm_isNapas: Bool = false
    var pm_isVisa: Bool = false
    var pm_isMoMo: Bool = false
    var pm_isExpandPaymentMethodSection: Bool = true
    
    // MARK: Order item info
    var oi_isExpandOrderItemInfoSection: Bool = true
    
    // MARK: Order summary
    var os_isExpandOrderSummarySection: Bool = true
}
