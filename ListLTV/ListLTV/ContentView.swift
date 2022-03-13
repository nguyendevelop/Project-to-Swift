//
//  ContentView.swift
//  ListLTV
//
//  Created by Nguyen Dang Quy on 30/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var total1 = 0
    @State private var total2 = 0
    
    let gd1 = ["Ba ruột", "Mẹ ruột", "Em gái RUỘT"]
    let gd2 = ["Lê Thu Vân", "Con 1 bà Vân: L.T.K. Duyên", "Con 2 bà Vân", "Con 3 bà Vân", "Con 4 bà Vân", "Con 5 bà Vân"]
    let gd3 = ["Võ Thị Tuyết Xuân"]
    let gd4 = ["Cao Thị Cúc", "Con 1 bà Cúc", "Con 2 bà Cúc: L.T.H. Trang"]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Gia đình 1 của Ô. Lê Tùng Vân")) {
                    ForEach(gd1, id: \.self) { gd1 in
                        Text(gd1.description.capitalized)
                            .swipeActions(edge: .leading) {
                                Button {
                                    total2 += 1
                                } label: {
                                    Label("Vo beo \(1)", systemImage: "pencil.tip")
                                }
                                .tint(.red)
                            }
                        
                            .swipeActions(edge: .trailing) {
                                Button {
                                    total1 += 1
                                } label: {
                                    Label("Cuoi \(1)", systemImage: "bed.double")
                                }
                                .tint(.indigo)
                            }
                    }
                }
                
                Section(header: Text("Gia đình 2 của Ô. Lê Tùng Vân")) {
                    ForEach(gd2, id: \.self) { gd2 in
                        Text(gd2.description.capitalized)
                            .swipeActions(edge: .leading) {
                                Button {
                                    total2 += 1
                                } label: {
                                    Label("Vo beo \(1)", systemImage: "pencil.tip")
                                }
                                .tint(.red)
                            }
                        
                            .swipeActions(edge: .trailing) {
                                Button {
                                    total1 += 1
                                } label: {
                                    Label("Cuoi \(1)", systemImage: "bed.double")
                                }
                                .tint(.indigo)
                            }
                    }
                }
                
                Section(header: Text("Gia đình 3 của Ô. Lê Tùng Vân")) {
                    ForEach(gd3, id: \.self) { gd3 in
                        Text(gd3.description.capitalized)
                            .swipeActions(edge: .leading) {
                                Button {
                                    total2 += 1
                                } label: {
                                    Label("Vo beo \(1)", systemImage: "pencil.tip")
                                }
                                .tint(.red)
                            }
                        
                            .swipeActions(edge: .trailing) {
                                Button {
                                    total1 += 1
                                } label: {
                                    Label("Cuoi \(1)", systemImage: "bed.double")
                                }
                                .tint(.indigo)
                            }
                    }
                }
                
                Section(header: Text("Gia đình 4 của Ô. Lê Tùng Vân")) {
                    ForEach(gd4, id: \.self) { gd4 in
                        Text(gd4.description.capitalized)
                            .swipeActions(edge: .leading) {
                                Button {
                                    total2 += 1
                                } label: {
                                    Label("Vo beo \(1)", systemImage: "pencil.tip")
                                }
                                .tint(.red)
                            }
                        
                            .swipeActions(edge: .trailing) {
                                Button {
                                    total1 += 1
                                } label: {
                                    Label("Cuoi \(1)", systemImage: "bed.double")
                                }
                                .tint(.indigo)
                            }
                    }
                }
                
            }
            .navigationTitle("Cưới: \(total1), Vỗ béo: \(total2)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
