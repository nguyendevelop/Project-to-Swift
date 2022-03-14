//
//  Home.swift
//  imageDrawing (iOS)
//
//  Created by Nguyen Dang Quy on 14/03/2022.
//

import SwiftUI

struct Home: View {
    
    
    @StateObject var model = DrawingViewModel()
    var body: some View {
        
        // Home Screen
        NavigationView{
            
            VStack{
                
                if let ImageFile = UIImage(data: model.imageData){
                    
                    Image(uiImage: ImageFile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //setting cancel button if image selected
                        .toolbar(content: {
                            
                            ToolbarItem(placement: .navigationBarLeading) {
                                
                                Button(action: model.cancelImageEditing, label: {
                                    Image(systemName: "xmark")
                                })
                            }
                        })
                }
                else{
                    //Show image picker button
                    Button(action: {model.showImagePicker.toggle()}, label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: -5)
                    })
                }
            }
                .navigationTitle("Image Editor")
        }
        // Showing Image Picker to pick image
        .sheet(isPresented: $model.showImagePicker, content: {ImagePicker(showPicker: $model.showImagePicker, imageData: $model.imageData)
            
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
