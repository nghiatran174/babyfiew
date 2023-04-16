//
//  LabelIconView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct LabelIconView: View {
    var systemName = "person"
    var backgroundColor = "pinkmain"
    var text = "Customer"
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
                .padding(10)
                .background(Color(backgroundColor))
                .cornerRadius(10)
            .foregroundColor(.white)
            Text(text)
                .bold()
        }
    }
}

struct LabelIconView_Previews: PreviewProvider {
    static var previews: some View {
        LabelIconView()
    }
}
