//
//  ProfileViewModel.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 04.02.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func changeProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let uid = self.user.id else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in

            let document = Firestore.firestore().collection("users").document(uid)
            document.updateData(["profileImageURL": imageURL]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
}
