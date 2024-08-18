//
//  FirebaseService.swift
//  KPhucSinh
//
//  Created by Jin on 10/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class FirebaseService {
    
    static let shared = FirebaseService()

    private var handler: AuthStateDidChangeListenerHandle?
    
    @Published var currentUserUid: String?
    
    private init()
    {
        handler = Auth.auth().addStateDidChangeListener({[weak self] _, user in
            self?.currentUserUid = user?.uid
        })
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func register(email: String, password: String, data: UserModel) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            try await createUser(uid: result.user.uid, userData: data)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func createUser(uid: String?, userData: UserModel) async throws {
        let firestore = Firestore.firestore()
        let collection = firestore.collection("users")
        let document = collection.document(uid!)
        let data = userData.toDictionary()
        try await document.setData(data)
    }
    
    func getUser() async throws -> UserModel? {
        
        var userData: UserModel?
        let firestore = Firestore.firestore()
        let collection = firestore.collection("users")
        let document = collection.document(currentUserUid!)
        do {
            let data = try await document.getDocument()
            userData = UserModel(
                fullName: data["fullName"] as? String ?? "",
                phone: data["phone"] as? String ?? "",
                email: data["email"] as? String ?? "",
                avatar: data["avatar"] as? String ?? "",
                isReceivePromotion: data["isReceivePromotion"] as? Bool ?? false,
                birthDate: data["birthDate"] as? TimeInterval ?? 0,
                gender: data["gender"] as? Int ?? 0,
                city: data["city"] as? Int ?? 0,
                district: data["district"] as? Int ?? 0,
                ward: data["ward"] as? Int ?? 0,
                address: data["address"] as? String ?? "",
                createdDate: data["createdDate"] as? TimeInterval ?? 0
            )
        }
        
        return userData
    }
}
