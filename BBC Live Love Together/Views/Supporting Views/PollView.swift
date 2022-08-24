//
//  CheckboxView.swift
//  BBC Live Love Together
//
//  Created by Omar Amoako on 09/06/2022.
//

import SwiftUI

struct PollView: View {
    
    init(viewModel: PollViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        viewModel.updateCheckBoxStates()
    }
    
    @StateObject var viewModel : PollViewModel

    var body: some View {
                
        Text(viewModel.question)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding([.leading, .trailing])
        
        ForEach(0..<viewModel.answerCount, id: \.self) { i in
            AnswerItem(id: i, check: $viewModel.checkboxStates[i], text: viewModel.options[i])
        }
        
        Capsule()
            .foregroundColor(.pink)
            .frame(height: 40)
            .overlay(Text("Submit").foregroundColor(.white))
            .padding([.leading, .trailing])
    }
}

struct AnswerItem: View, Identifiable {
    
    //UUID().uuidString
    var id : Int

    @Binding var check: Bool
    
    var text: String
    
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack() {
                CheckBoxView(checked: $check)
                Text(text)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
        }
         .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
         .padding()
    }
    
}



class PollViewModel: ObservableObject {
    
    @Published var checkboxStates : [Bool] = []
    let answerCount: Int
    
    init(question: String, options: [String]) {
        
        self.question = question
        self.options = options
        self.answerCount = options.count
    }
    
    let question: String
    var options : [String]
    
    func updateCheckBoxStates() {
        for _ in options {
            checkboxStates.append(false)
        }
    }
}
