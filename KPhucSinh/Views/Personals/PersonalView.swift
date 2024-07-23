//
//  PersonalView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI

struct PersonalView: View {
    var body: some View {
        VStack {
            
            // MARK: INFO
            HStack {
                KPS_ImageView(url: Consts.avatar, aspectRatio: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text("Quốc Thảo")
                        .font(.title2)
                        .foregroundColor(Consts.secondaryColor)
                        .bold()
                    
                    Text("+84855980201")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(Consts.primaryColor)
            
            // MARK: ACCOUNT SECTION
            HStack {
                Spacer()
                
                // TAI KHOAN
                VStack(spacing: 10) {
                    Image(systemName: "person.text.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.secondaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("TÀI KHOẢN")
                        .font(.callout)
                        .foregroundColor(Consts.secondaryColor)
                }
                .padding()
                .frame(width: 135, height: 80)
                .background(Consts.primaryColor)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
                
                // LICH SU
                VStack(spacing: 10) {
                    Image(systemName: "text.document")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.secondaryColor)
                        .controlSize(.large)
                        .frame(width: 40, height: 40)
                    
                    Text("TÀI KHOẢN")
                        .font(.callout)
                        .foregroundColor(Consts.secondaryColor)
                }
                .padding()
                .frame(width: 135, height: 80)
                .background(Consts.primaryColor)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
                
                // MA GIAM GIA
                VStack(spacing: 10) {
                    Image(systemName: "ticket")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.secondaryColor)
                        .controlSize(.large)
                        .frame(width: 40, height: 40)
                    
                    Text("MÃ GIẢM GIÁ")
                        .font(.callout)
                        .foregroundColor(Consts.secondaryColor)
                }
                .padding()
                .frame(width: 135, height: 80)
                .background(Consts.primaryColor)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
            }
            .padding()
            
            // MARK: MEMBERSHIP
            VStack(alignment: .leading, spacing: 30) {
                HStack {
                    Image(systemName: "crown")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Thành viên")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
                
                HStack {
                    Image(systemName: "text.book.closed")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Địa chỉ giao hàng")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
                
                HStack {
                    Image(systemName: "checkmark.seal.text.page")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Kiểm tra đơn hàng")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
                
                HStack {
                    Image(systemName: "text.document")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Điều khoản sử dụng & Chính sách")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
                
                HStack {
                    Image(systemName: "person.badge.minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Đóng tài khoản")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
                
                HStack {
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 40, height: 40)
                    
                    Text("Đăng xuất")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Consts.primaryColor)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Consts.primaryColor)
                        .frame(width: 15, height: 15)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    PersonalView()
}
