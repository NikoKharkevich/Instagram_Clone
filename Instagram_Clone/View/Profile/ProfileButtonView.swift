//
//  ProfileButtonView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 05.02.2022.
//

import SwiftUI

struct ProfileButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 36)
                    .foregroundColor(.black)
                    .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            }

        } else {
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 36)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 36)
                        .foregroundColor(.black)
                        .background(Color.blue)
                        .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1) // to cut out inner peeces
                        )
                }

            }
        }
    }
}

