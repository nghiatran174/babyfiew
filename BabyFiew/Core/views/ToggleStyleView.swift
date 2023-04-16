//
//  ToggleStyleView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct ToggleStyleView: View {
    @State var isChecked = false
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text("Test checkbox")
        }
        .toggleStyle(CheckboxToggleStyle())
    }
}

struct ToggleStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyleView()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}
