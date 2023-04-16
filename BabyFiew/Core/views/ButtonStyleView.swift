//
//  ButtonStyleView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Button(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/){
            
        }
        .buttonStyle(NormalButton())
    }
}

struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}

struct NormalButton: ButtonStyle {
    var width:CGFloat? = nil
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width)
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color("pinkmain"))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
