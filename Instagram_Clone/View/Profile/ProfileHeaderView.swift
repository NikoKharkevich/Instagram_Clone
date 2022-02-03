//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ted")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 210, title: "Posts")
                    UserStats(value: 12344, title: "Followers")
                    UserStats(value: 14, title: "Following")
                }.padding(.trailing, 32)

            }

        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
