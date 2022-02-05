//
//  FeedViewModel.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 05.02.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        fetchPost()
    }
         
    func fetchPost() {
        
        let collection = Firestore.firestore().collection("posts")
        collection.getDocuments { snap, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
