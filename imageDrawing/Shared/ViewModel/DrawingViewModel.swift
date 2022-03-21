//
//  DrawingViewModel.swift
//  imageDrawing (iOS)
//
//  Created by Nguyen Dang Quy on 14/03/2022.
//

import SwiftUI
import PencilKit

// it holds all our drawing data
class DrawingViewModel: ObservableObject {
    
    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)
    
    //Canvas for drawing
    @Published var canvas = PKCanvasView()
    //Tool picker
    @Published var toolPicker = PKToolPicker()
    
    //List of TextBoxes
    @Published var textBoxes : [TextBox] = []
    
    @Published var addNewBox = false
    
    //Current index
    @Published var currentIndex : Int = 0
    
    //cancel function
    func cancelImageEditing(){
        imageData = Data(count: 0)
        canvas = PKCanvasView()
    }
    
    //cancel the text view
    func cancelTextView(){
        
        //showing again the tool bar
        toolPicker.setVisible(true, forFirstResponder: canvas)
        canvas.becomeFirstResponder()
        
        withAnimation {
            addNewBox = false
        }
        
        //removing if cancelled
//        textBoxes.removeLast()
    }
}
