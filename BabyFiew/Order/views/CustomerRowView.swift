//
//  CustomerRowView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 17/04/2023.
//

import SwiftUI

struct CustomerRowView: View {
    var customerModel: Baby
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Bố/mẹ: \(customerModel.parent.name) - \(customerModel.parent.phone)")
            Text("Bé: \(customerModel.name) - \(customerModel.nickName)")
//            Text("Ngày sinh: \(customerModel.dateOfBirth.formatted()) - \(customerModel.monthOld) thang tuoi")
        }
    }
}

struct CustomerRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerRowView(customerModel: Baby())
    }
}
