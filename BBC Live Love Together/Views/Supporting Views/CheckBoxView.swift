//
//  CheckBoxView.swift
//  BBC Live Love Together
//
//  Created by Omar Amoako on 10/06/2022.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(checked ? Color(UIColor.systemPink) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
