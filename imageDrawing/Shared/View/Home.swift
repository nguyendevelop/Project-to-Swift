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
        ZStack{
            NavigationView{
                
                VStack{
                    
                    if let _ = UIImage(data: model.imageData){
                        
                        DrawingScreen()
                            .environmentObject(model)
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
            
            if model.addNewBox{
                
                Color.black.opacity(0.75)
                    .ignoresSafeArea()
                
                //TextField
                TextField("Type Here", text: $model.textBoxes[model.currentIndex].text)
                    .font(.system(size: 35))
                    .colorScheme(.dark)
//                    .foregroundColor(model.textBoxes[model.currentIndex].textColor)
                    .padding()
                
                //add and cancel button
                HStack{
                    
                    Button(action: {
                        //closing the view
                        withAnimation{
                            model.addNewBox = false
                        }
                    }, label: {
                        Text("Add")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        //Closing the view
                        model.cancelTextView()
                    }, label: {
                        Text("Cancel")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    })
                }
                .overlay(
                    // ColorPicker
                    ColorPicker("", selection: $model.textBoxes[model.currentIndex].textColor)
                        .labelsHidden()
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
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
