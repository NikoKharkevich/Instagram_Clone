//
//  ForgotPasswordView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 04.02.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Binding var email: String
    
    init(email: Binding<String>) {
        self._email = email
        
    }
    
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
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink  {
                        SigninView()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Go back")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }.padding(.horizontal, 24)
                
                Button {
                    
                } label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                NavigationLink(
                    destination: SigninView().navigationBarHidden(true),
                    label: {
                    HStack {
                        Text("Already have any account?")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("Sign Up")
                            .font(.system(size: 14))
                    }
                })
            }.padding(.top, -80) // to push view up
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(email: .constant("email"))
    }
}
