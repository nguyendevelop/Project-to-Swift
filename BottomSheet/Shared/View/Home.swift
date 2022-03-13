//
//  Home.swift
//  BottomSheet (iOS)
//
//  Created by Nguyen Dang Quy on 31/01/2022.
//

import SwiftUI

struct Home: View {
    //Search text binding value
    @State var searchText = ""
    
    //Gesture Properties
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in: .global)
                
                Image("post2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
            }
            .ignoresSafeArea()
            
            //Bottom Sheet
            
            GeometryReader{proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                return AnyView(
                
                    ZStack{
                        BlurView(style: .systemMaterialDark)
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))
                        
                        ZStack{
                            
                            Capsule()
                                .fill(Color.white)
                                .frame(width: 60, height: 4)
                                .padding(.top)
                            
                            TextField("Search", text: $searchText)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(BlurView(style: .dark))
                                .cornerRadius(10)
                                .colorScheme(.dark)
                                .padding(.top,10)
                        }
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: height - 100)
                        .offset(y: offset)
                        .gesture(DragGesture().updating($gestureOffset, body: {
                            value, out, _ in
                            
                            out = value.translation.height
                            onChange()
                        }))
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    func onChange(){
        DispatchQueue.main.async {
            self.offset = gestureOffset
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
