//
//  RegisterView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Image("instagram-text-logo")
                    .renderingMode(.template) // allows to change a color of the image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.black)
                
                VStack(spacing: -16) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Text("Forgot pasword?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                NavigationLink(destination: SigninView(), label: {
                    HStack {
                        Text("Don't have any account?")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("Sign In")
                            .font(.system(size: 14))
                    }
                })
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
