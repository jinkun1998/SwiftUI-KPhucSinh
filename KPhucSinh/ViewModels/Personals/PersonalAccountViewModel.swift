//
//  PersonalAccountViewModel.swift
//  KPhucSinh
//
//  Created by Jin on 18/8/24.
//

import Foundation

@Observable class PersonalAccountViewModel {
    var fullName: String = ""
    var phone: String = ""
    var email: String = ""
    var isReceivePromotion: Bool = true
    var dayOfBirth: String = "1"
    var monthOfBirth: String = "1"
    var yearOfBirth: String = "1970"
    var genders: [CheckboxModel] = []
    var city: DropdownBoxModel?
    var district: DropdownBoxModel?
    var ward: DropdownBoxModel?
    var address: String = ""
    
    func fetchData() async throws {
        try await getCurrentUser()
        getCities()
        getDistricts()
        getWards()
        getGenders()
    }
    
    func getCurrentUser() async throws {
        guard let userData = try await FirebaseService.shared.getUser() else {
            return
        }
        
        self.fullName = userData.fullName
        self.phone = userData.phone
        self.email = userData.email
        self.isReceivePromotion = userData.isReceivePromotion
        
        let birthDate = Date(timeIntervalSince1970: userData.birthDate)
        self.dayOfBirth = "\(birthDate.getComponent(component: .day))"
        self.monthOfBirth = "\(birthDate.getComponent(component: .month))"
        self.yearOfBirth = "\(birthDate.getComponent(component: .year))"
        self.genders = self.genders.map { gender in
            return CheckboxModel(id: gender.id, title: gender.title, isChecked: gender.id == userData.gender ? true: false)
        }
        self.city = self.cities.first {$0.originalId == userData.city}
        self.district = self.districts.first {$0.originalId == userData.district}
        self.ward = self.wards.first {$0.originalId == userData.ward}
        self.address = userData.address
    }
    
    var cities: [DropdownBoxModel] = []
    func getCities() {
        self.cities = [
            DropdownBoxModel(
                originalId: 1,
                name: "Hồ Chí Minh"
            ),
            DropdownBoxModel(
                originalId: 2,
                name: "Hà Nội"
            )
        ]
    }
    
    var districts: [DropdownBoxModel] = []
    func getDistricts() {
        self.districts = cities
    }
    
    var wards: [DropdownBoxModel] = []
    func getWards() {
        self.wards = cities
    }
    
    func getGenders(){
        self.genders = [
            CheckboxModel(id: 1, title: "Nam", isChecked: true),
            CheckboxModel(id: 2, title: "Nữ", isChecked: false),
            CheckboxModel(id: 3, title: "Khác", isChecked: false)
        ]
    }
}
