//
//  Home.swift
//  CoverInstagram
//
//  Created by Nguyen Dang Quy on 26/01/2022.
// https://youtu.be/h7O0e_lGkL8

import SwiftUI

struct Home: View {
    var body: some View {
        
        //Building Home View
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                //
                ForEach(1...6,id: \.self){index in
                    
                    //Card View...
                    CardView(index: index)
                }
            }
            .padding()
        }
        
        //Top Nar Bar
        .safeAreaInset(edge: .top) {
            
            HStack {
                Button {
                    
                } label: {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
            
            .overlay(
                Text("Nguyễn Develop")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
            )
            
            .padding(.horizontal)
            .padding(.vertical,10)
            //Blur background
            .background(.ultraThinMaterial)
            
            //Shadow
            .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
    

    @ViewBuilder
    func CardView(index: Int)->some View{
        
        VStack(alignment: .leading, spacing: 12) {
            //Post Image...
            GeometryReader{proxy in
                let size = proxy.size
                
                Image("Post\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
                    
            }
            .frame(height: 250)
            
            //Input Button...
            HStack(spacing: 15) {
                ForEach(["heart","message","paperplane","bookmark"],id: \.self){image in
                    
                    Group {
                        //Pushing bookmark button to last...
                        if image == "bookmark"{
                            Spacer()
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: image)
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
            //Radom Likes
            Text("\(Int.random(in: 0...5)) likes")
                .font(.callout)
                .fontWeight(.semibold)
                                  
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                .font(.callout)
                .lineLimit(2)
                .truncationMode(.tail)
        
            //Radom Cmt
            Text("See all \(Int.random(in: 16...25)) Comments")
                .font(.callout)
                .foregroundColor(Color.gray)
            
            //Radom date
            Text("JANUARY \(Int.random(in: 1...31))")
                .font(.callout)
                .foregroundColor(Color.gray)
            .lineSpacing(15.0)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
