//
//  ResultSearchRow.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import SwiftUI

struct ResultSearchRow: View {
    var baby: Baby
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .background(Color("bluemain"))
                .cornerRadius(10)

            VStack(spacing: 10) {
                Text("\(baby.nickName) - \(baby.name)")
                Text(" \(baby.parent.name) - \(baby.parent.phone)")
            }
            
            Spacer()
        }
    }
}

struct ResultSearchRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearchRow(baby: Baby(id: 123, name: "Ten day du", nickName: "nickname", parent: Customer(id: 123, name: "Ten bo me", phone: "098123712", gender: .male), gender: .female, avatar: nil))
    }
}
