//
//  AuthViewModel.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 04.02.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    static let shared = AuthViewModel()
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // if no error we checking the user
            guard let user = result?.user else { return }
            print(user)
        }
    }
}
