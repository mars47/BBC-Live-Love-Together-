//
//  SocialMediaView.swift
//  BBC Live Love Together
//
//  Created by Omar Amoako on 10/06/2022.
//

import SwiftUI

struct SocialMediaView: View {
        
    var body: some View {
        HStack{
            HStack(spacing:32){
                Label("78", systemImage: "hand.thumbsup.fill").font(.footnote)
                Label("23", systemImage: "hand.thumbsdown.fill").font(.footnote)
            }
            Spacer()
            HStack{
                Image("facebook").resizable().frame(width: 25, height: 25).tint(.white)
                Image("twitter").resizable().frame(width: 25, height: 25).tint(.white)
                Image(systemName: "square.and.arrow.up")
            }
        }
    }
}
