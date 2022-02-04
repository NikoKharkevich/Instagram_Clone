//
//  ProfileView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))
                    .padding()
                
                PostGridView()
            }.padding(.top)
        }
    }
}
