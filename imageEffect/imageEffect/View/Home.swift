//
//  Home.swift
//  imageEffect
//
//  Created by Nguyen Dang Quy on 31/12/2021.
//

import SwiftUI

struct Home: View {
    @State var motionData = MotionObserver()
    var body: some View {
        
        ZStack{
            
            GeometryReader{proxy in
                let size = proxy.size
                
                Image("avatar2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(0)
                
                //Slighly Diming
                Color.black
                    .opacity(0.2)
            }
            // Blur Overlay
            .overlay(.ultraThinMaterial)
            .ignoresSafeArea()
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image("avatar2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(25)
            }
            .frame(height: 450)
            .padding(.horizontal, 40)
            //Applying offset here
            //
            .offset(motionData.movingOffset)
                        
        }
        //
        .onAppear(perform: {
            //
            //
            motionData.fetchMotionData(duration: 30)
        })
        
        //Preffered to be Dark..
        .environment(\.colorScheme, .dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
