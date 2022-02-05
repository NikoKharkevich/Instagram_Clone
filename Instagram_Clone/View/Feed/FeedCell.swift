//
//  FeedCell.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: post.ownerImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
                
                Image(systemName: "bubble.right")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
                
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            Text("25 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 0.5)
            
            HStack {
                Text(post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text("  \(post.caption)")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
            
            Text("2H")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}
