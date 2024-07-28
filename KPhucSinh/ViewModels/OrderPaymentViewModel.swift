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
    var si_isReceiveAtStore: Bool = true
    var si_isShippingToCustomer: Bool = false
    var si_shippingNote: String = ""
    var si_isExpandShippingMethodSection: Bool = true
    
    func onAddressChange() {
        guard let address = si_selectedAddress else { return }
        
        ri_fullName = address.fullName
        ri_phone = address.phone
        si_address = address.address
    }
    
    // MARK: Payment method
    var pm_isCOD: Bool = true
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
