//
//  AuthViewModel.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 04.02.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    // checking if there is a current user
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // if no error we create the user
            guard let user = result?.user else { return }
            
            // once user created it has uid
            let data = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "uid": user.uid
            ]
            // then we add user details like name and nick to Firestore as initial adding via Auth register is not supported
            // in Firestore we create collection "users" with document named same as user.uid
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
