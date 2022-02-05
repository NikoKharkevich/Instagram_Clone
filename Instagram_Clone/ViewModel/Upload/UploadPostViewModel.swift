//
//  UploadPostViewModel.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 05.02.2022.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(image: UIImage, caption: String) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageURL in
            
            guard let uid = user.id else { return }
            
            let data = [
                "caption": caption,
                "timestamp": Timestamp(date: Date()),
                "likes": 0,
                "imageURL": imageURL,
                "ownerUid": uid,
                "ownerImageURL": user.profileImageURL,
                "ownerUsername": user.username
            ] as [String: Any]
            
            let collection = Firestore.firestore().collection("posts")
            
            collection.addDocument(data: data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
}
