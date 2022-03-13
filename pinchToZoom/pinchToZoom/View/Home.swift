//
//  Home.swift
//  pinchToZoom
//
//  Created by Nguyen Dang Quy on 26/01/2022.
// https://www.youtube.com/watch?v=9sZuR4eaPDU

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18){
                
                ForEach(1...5, id: \.self) {index in
                    Image("post0\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width - 30, height: 250)
                        .cornerRadius(15)
                        .addPinchZoom()
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "camera.fill")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                }
            }
            .overlay(
                Text("Instaram")
                    .font(.title2.bold())
            )
            .padding()
            .foregroundColor(.primary)
            .background(.ultraThinMaterial)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    func addPinchZoom()->some View {
        return PichZoomContext {
            self
        }
    }
}

struct PichZoomContext<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
    }
    
    @State var offset: CGPoint = .zero
    @State var scale: CGFloat = 0
    
    var body: some View {
        content
        //
            .overlay {
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    ZoomGesture(size: size, scale: $scale, offset: $offset)
                }
            }
            .scaleEffect(1 + scale)
    }
}

struct ZoomGesture: UIViewRepresentable {
    
    var size: CGSize
    
    @Binding var scale: CGFloat
    @Binding var offset: CGPoint
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    //makeUIView()
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        let Pinchgesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinch(sender:)))
         
        view.addGestureRecognizer(Pinchgesture)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject {
        var parent: ZoomGesture
        
        init(parent: ZoomGesture) {
            self.parent = parent
        }
        
        @objc
        func handlePinch(sender: UIPinchGestureRecognizer) {
            if sender.state == .began || sender.state == .changed {
                
                parent.scale = sender.scale
            }else {
                withAnimation(.easeInOut(duration: 0.35)) {
                    parent.scale = 0
                }
            }
        }
    }
}

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
