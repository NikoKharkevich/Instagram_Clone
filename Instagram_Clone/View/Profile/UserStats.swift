//
//  UserStats.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI

struct UserStats: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text(title)
                .font(.system(size: 15, weight: .semibold))
        }
        // when we use view in another view we have to specify frame
        .frame(width: 80, alignment: .center)
    }
}
