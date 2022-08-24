//
//  ContentView.swift
//  BBC Live Love Together
//
//  Created by Omar Amoako on 07/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    
    let titles: [String] =
    ["More from this series",
     "Recomended to you"]
    
    var body: some View {
        
        NavigationView{
        ScrollView {
            StretchyHeaderView()
            VStack(alignment: .leading, spacing: 8){
                Text("Entertainment | BBC One").font(.subheadline)
                Text("Strictly Come Dancing").font(.title).fontWeight(.bold)
                Text("Series 19 Christmas Special")
                Capsule().frame(width: 20, height: 5).foregroundColor(.pink)
                Text("Tess Day and Claudia Winkelman host an all-star Chritmas special")
                Text("74 mins   25 Dec 2021    Available for 6 months")
                Rectangle()
                    .frame(height: 30)
                    .foregroundColor(.pink)
                    .overlay( HStack{
                        Image(systemName: "play.fill")
                        Text("74 Mins Left")
                    })
                NavigationLink(destination: BBCInteractiveView()) {
                    Rectangle()
                        .frame(height: 30)
                        .foregroundColor(.purple)
                        .overlay(Text("Strictly Interactive"))
                }
            }.padding()
            .font(.subheadline)
            .foregroundColor(.white)
            
            HStack(spacing: 24){
                Label("Add", systemImage: "plus")
                Label("Share", systemImage: "square.and.arrow.up")
                Label("Download", systemImage: "square.and.arrow.down")
            }
            .foregroundColor(.white)
            .padding(.top, 16)
            
            SegmentedControlView(selectedIndex: $selectedIndex, titles: titles)
                .padding(.leading, 8)
        }
        
        .background(.black)
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
