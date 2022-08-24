//
//  DetailView.swift
//  BBC Live Love Together
//
//  Created by Omar Amoako on 08/06/2022.
//

import Foundation
import SwiftUI

struct BBCInteractiveView: View {
    
    @State var selectedIndex: Int = 0
    var height = UIScreen.main.bounds.height / 3.5
    let titles: [String] = [ "Dashboard", "Vote", "Guess", "Leaderboard", "Quiz", "Live Chat"]
    
    var videoView: some View {
        VideoView(videoID: "mxjMmJMwwpA")
            .frame(minHeight: height, maxHeight: height)
            .cornerRadius(12)
            .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
    
    var body: some View {
        
        ScrollView {
            videoView
            SegmentedControlView(selectedIndex: $selectedIndex, titles: titles)
            interactiveView
        }
        .background(.black)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Strictly Interactive")
        //.edgesIgnoringSafeArea(.top)
    }
    
    var interactiveView: some View {
        
        switch selectedIndex {
            
        case 0: return AnyView(DashBoardView().cornerRadius(12).padding())
        case 1: return AnyView(VoteView())
        case 2: return AnyView(GuessView())
        case 3: return AnyView(LeaderboardView())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct DashBoardView: View {
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 8){
            
            HStack{
                Text("NEW").fontWeight(.bold).background(.pink)
                Text("21:03").font(.footnote)
            }.foregroundColor(.white)
            VStack(alignment:.leading){
            Text("Get Involved - reaction").font(.title).fontWeight(.bold)
            Text("#strictlyComeDancing or text 81111 (UK only - standard message rates apply)").font(.system(size: 11))
            }
            Text("Strictly Come Dancing’s David James becomes fourth celebrity to be eliminated ").fontWeight(.light).font(.system(size: 14))
            SocialMediaView()
        }
            .foregroundColor(.white)
            .padding()
            .background(Color("charcoal"))

        
        VStack(alignment:.leading, spacing: 8){

            Text("19:27").font(.footnote).foregroundColor(.white)
            Text("Gorka Marquez replaced on the Strictly Come Dancing tour").font(.title).fontWeight(.bold)
            Text("\"I'm very disappointed not to be able to join the tour, but I must follow medical advice and rest and recuperate,\" the dancer said. \"I'll be cheering everyone on from home. Audiences are in for a real treat!\" ").fontWeight(.light).font(.system(size: 14))
            SocialMediaView()
        }.foregroundColor(.white)
            .padding()
            .background(Color("charcoal"))
    }
}

struct GuessView: View {
    
    var body: some View {

        let options = ["10", "9", "8", "7", "6", "5", "4", "3", "2", "1"]
        let viewModel = PollViewModel(question: "Predict the correct scorecard:", options: options)
        PollView(viewModel: viewModel)
    }
}

struct VoteView: View {
    
    var body: some View {
        let options = ["David and Nadia", "Mike and Katya"]
        let viewModel = PollViewModel(question: "Who deserves to win?", options: options)
        PollView(viewModel: viewModel)
    }
}

struct LeaderboardView: View {
    
    var body: some View {
        
        let names = ["Shelly121", "Sarahhh", "Oscar__", "Hilda_65", "Jonno441", "Max78",  "Tracy.m", "Wendy23", "Marta.95", "Haze", "Leon07"]
        
        let scores = ["468", "460", "429", "415", "389", "376", "350", "321", "309", "298", "290" ]
        
        VStack{
            HStack{
                Text("Username").fontWeight(.bold)
                Spacer()
                Text("Score").fontWeight(.bold)
            }
             .foregroundColor(.white)
             .padding()
            
            ForEach(0..<names.count, id: \.self) { i in
                HStack(){
                    Text(names[i])
                    Spacer()
                    Text(scores[i])
                }
            }
             .foregroundColor(.white)
             .padding([.leading, .trailing])
             .padding([.top, .bottom], 2)
        }
         .background(Color("charcoal"))
         .cornerRadius(12)
         .padding([.leading, .trailing], 100)
    }
}


