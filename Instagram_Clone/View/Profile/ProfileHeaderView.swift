//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State var selectedImage: UIImage?
    @State var userImage: Image? = Image("profile-placeholder")
    @State var isImagePickerPresented = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                ZStack {
                    // we show avatar if it exists in Firestore
                    if let imageURL = viewModel.user.profileImageURL {
                        
                        Button {
                            self.isImagePickerPresented.toggle()
                        } label: {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }.sheet(isPresented: $isImagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                        
                    } else {
                        // otherwise we show default image with option to choose avatar via image picker (in button)
                        Button {
                            self.isImagePickerPresented.toggle()
                        } label: {
                            // replaced Image("profile-placeholder") with userImage to get image seen after uploading
                            userImage?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }.sheet(isPresented: $isImagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }

                    }
                }.padding(.horizontal)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStats(value: 210, title: "Posts")
                    UserStats(value: 12344, title: "Followers")
                    UserStats(value: 14, title: "Following")
                }.padding(.trailing, 32)
            }

            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
                .padding(.leading, 18)
            
            HStack {
                Spacer()
                ProfileButtonView(viewModel: viewModel)
                Spacer()
            }.padding(.top)
        }
    }
}

extension ProfileHeaderView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        userImage = Image(uiImage: selectedImage)
        viewModel.changeProfileImage(image: selectedImage) { _ in
            print("DEBUG: Uploaded Image")
        }
    }
}
