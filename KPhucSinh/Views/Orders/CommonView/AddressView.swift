//
//  AddressView.swift
//  KPhucSinh
//
//  Created by Jin on 28/7/24.
//

import SwiftUI

struct AddressView: View {
    
    @Environment(\.dismiss) var dismiss: DismissAction
    
    private let navigationTitle: String = "Địa chỉ giao hàng"
    
    @State private var addresses: [AddressModel] = []
    @Binding var selectedAddress: AddressModel?
    
    var body: some View {
        VStack {
            List {
                ForEach(addresses) { address in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 20) {
                            Text(address.fullName)
                            
                            if (address.isDefault) {
                                Text("Địa chỉ mặc định")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                                    .background(content: {
                                        KPS_DefaultAddressShape()
                                            .fill(Consts.primaryColor)
                                            .frame(width: 130, height: 25)
                                    })
                            }
                        }
                            
                        Text(address.phone)
                        
                        Text(address.address)
                    }
                    .onTapGesture {
                        selectedAddress = address
                        dismiss.callAsFunction()
                    }
                }
            }
            .listStyle(.plain)
        }
        .useStandardToolBarStyle(title: navigationTitle) {
            NavigationLink {
                EmptyView()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }

        }
        .onAppear {
            addresses = AddressModel.addresses
        }
    }
}

#Preview {
    AddressView(selectedAddress: .constant(AddressModel.addresses.first!))
}
