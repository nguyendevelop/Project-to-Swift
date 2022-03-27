//
//  DrawingScreen.swift
//  imageDrawing (iOS)
//
//  Created by Nguyen Dang Quy on 15/03/2022.
//

import SwiftUI
import PencilKit

struct DrawingScreen: View {
    @EnvironmentObject var model: DrawingViewModel
    var body: some View {
        
        ZStack{
            
            GeometryReader{proxy -> AnyView in
                
                let size = proxy.frame(in: .global).size
                
                return AnyView(
                
                    ZStack{
                        
                        //UIKit Pencil Kit Drawing View
                        CanvasView(canvas: $model.canvas, imageData: $model.imageData, toolPicker: $model.toolPicker, rect: size)
                        
                        //Custom text
                        
//                        //displaying text boxes
//                        ForEach(model.textBoxes){box in
//                            
//                            Text(box.text)
//                            //you can also include text size in model
//                            //and can use those text sizes in these text boxes
//                                .font(.system(size: 30))
//                                .fontWeight(box.isBold ? .bold : .none)
//                                .foregroundColor(box.textColor)
//                                .offset(box.offset)
//                        }
                    }
                )
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing){
                
                Button(action: {}, label: {
                    Text("Save")
                })
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                
                Button(action: {
                    
                    // creating one new box
                    model.textBoxes.append(TextBox())
                    
                    //updating index
                    model.currentIndex = model.textBoxes.count - 1
                    
                    withAnimation {
                        model.addNewBox.toggle()
                    }
                    //closing the tool bar
                    model.toolPicker.setVisible(false, forFirstResponder: model.canvas)
                    model.canvas.resignFirstResponder()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
    }
}

struct DrawingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CanvasView: UIViewRepresentable {
    
    //since we need to get the drawings so were binding
    @Binding var canvas: PKCanvasView
    @Binding var imageData : Data
    @Binding var toolPicker: PKToolPicker
    
    //view size
    var rect: CGSize
    
    func makeUIView(context: Context) -> PKCanvasView {
         
        canvas.isOpaque = false
        canvas.backgroundColor = .clear
        canvas.drawingPolicy = .anyInput
        

        
        // appending the image in canvas subview
        if let image = UIImage(data: imageData){
            
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
            //basically were setting image to the back of the canvas
            let subView = canvas.subviews[0]
            subView.addSubview(imageView)
            subView.sendSubviewToBack(imageView)
            
            //show tool picker
            //were setting it as first responder and making it as visible
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
        }
        
        return canvas
        
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
        // update ui will update for each actions

        
    }
}
