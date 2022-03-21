//
//  TextBox.swift
//  imageDrawing (iOS)
//
//  Created by Nguyen Dang Quy on 16/03/2022.
//

import SwiftUI
import PencilKit

struct TextBox: Identifiable {
    
    var id = UUID().uuidString
    var text: String = ""
    var isBold: Bool = false
    //For Dragging the view over the screen
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    var textColor: Color = .white
    //you can add what ever property here
    //im simply stopping on this
    
}
