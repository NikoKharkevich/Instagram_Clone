//
//  Post.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 05.02.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp
    let ownerImageURL: String
}
