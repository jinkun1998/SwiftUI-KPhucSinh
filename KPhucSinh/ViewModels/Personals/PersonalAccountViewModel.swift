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
        try await getCities()
        try await getDistricts(provinceId: city?.originalId ?? 0)
        try await getWards(districtId: district?.originalId ?? 0)
        getGenders()
        try await getCurrentUser()
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
        
        self.address = userData.address
    }
    
    func updateCurrentUser() async throws {
        guard var userData = try await FirebaseService.shared.getUser() else {
            return
        }
        
        userData.fullName = self.fullName
        userData.phone = self.phone
        userData.email = self.email
        userData.isReceivePromotion = self.isReceivePromotion
        
        let components = DateComponents(year: Int(self.yearOfBirth), month: Int(self.monthOfBirth), day: Int(self.dayOfBirth))
        
        userData.birthDate = Calendar(identifier: .gregorian).date(from: components)!.timeIntervalSince1970
        
        userData.gender = self.genders.first { $0.isChecked }!.id
        userData.city = self.city?.originalId
        userData.district = self.district?.originalId
        userData.ward = self.ward?.originalId
        userData.address = self.address
        
        try await FirebaseService.shared.updateUser(user: userData)
    }
    
    var cities: [DropdownBoxModel] = []
    func getCities() async throws {
        
        guard let userData = try await FirebaseService.shared.getUser() else {
            return
        }
        
        let response: BaseLocationResponse<ProvinceInfoResponse> = try await HttpService
            .shared
            .fetchData(url: "https://open.oapi.vn/location/provinces?page=0&size=1000&query=", httpMethod: "GET")
        
        self.cities = response.data.map({ province in
            return DropdownBoxModel(originalId: Int(province.id) ?? 0, name: province.name)
        })
        
        self.city = self.cities.first {$0.originalId == userData.city}
    }
    
    var districts: [DropdownBoxModel] = []
    func getDistricts(provinceId: Int) async throws {
        
        guard let userData = try await FirebaseService.shared.getUser() else {
            return
        }
        
        let response: BaseLocationResponse<DistrictInfoResponse> = try await HttpService
            .shared
            .fetchData(url: "https://open.oapi.vn/location/districts/\(provinceId)?page=0&size=1000&query=", httpMethod: "GET")
        
        self.districts = response.data.map({ district in
            return DropdownBoxModel(originalId: Int(district.id) ?? 0, name: district.name)
        })
        
        self.district = self.districts.first {$0.originalId == userData.district}
    }
    
    var wards: [DropdownBoxModel] = []
    func getWards(districtId: Int) async throws {
        
        guard let userData = try await FirebaseService.shared.getUser() else {
            return
        }
        
        let response: BaseLocationResponse<WardInfoResponse> = try await HttpService
            .shared
            .fetchData(url: "https://open.oapi.vn/location/wards/\(districtId)?page=0&size=1000&query=", httpMethod: "GET")
        
        self.wards = response.data.map({ ward in
            return DropdownBoxModel(originalId: Int(ward.id) ?? 0, name: ward.name)
        })
        
        self.ward = self.wards.first {$0.originalId == userData.ward}
    }
    
    func getGenders(){
        self.genders = [
            CheckboxModel(id: 1, title: "Nam", isChecked: true),
            CheckboxModel(id: 2, title: "Nữ", isChecked: false),
            CheckboxModel(id: 3, title: "Khác", isChecked: false)
        ]
    }
}
