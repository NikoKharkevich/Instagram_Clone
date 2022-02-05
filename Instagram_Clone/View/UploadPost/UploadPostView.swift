//
//  UploadPostView.swift
//  Instagram_Clone
//
//  Created by Nikola Kharkevich on 03.02.2022.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var captionText = ""
    @State private var imagePickerRepresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        
        if postImage == nil {
            Button {
                self.imagePickerRepresented.toggle()
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipped()
                    .padding(.top)
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $imagePickerRepresented) {
                loadImage()
            } content: {
                ImagePicker(image: $selectedImage)
            }
        } else if let image = postImage {
            VStack {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "Enter your caption")
                        
                }.padding()
                
                // uploading image
                Button {
                    viewModel.uploadPost(image: selectedImage!, caption: captionText)
                    captionText = ""
                    postImage = nil
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                Spacer() // to push everything on top
            }
        }
        
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

