//
//  DrawingViewModel.swift
//  imageDrawing (iOS)
//
//  Created by Nguyen Dang Quy on 14/03/2022.
//

import SwiftUI

// it holds all our drawing data
class DrawingViewModel: ObservableObject {
    
    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)
    
    //cancel function
    func cancelImageEditing(){
        imageData = Data(count: 0)
    }
}
