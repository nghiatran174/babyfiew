//
//  CreateCustomerView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 17/04/2023.
//

import SwiftUI

struct CreateCustomerView: View {
    @Binding var showView: Bool
    @State var name = ""
    @State private var date = Date()
    
    var body: some View {
    
        NavigationView {
            Form {
                TextField("Tên bố (mẹ)", text: $name)
                TextField("Số điện thoại", text: $name)
                TextField("Tên bé", text: $name)
                TextField("Biệt danh bé", text: $name)
                DatePicker("Ngày sinh", selection: $date,displayedComponents: [.date])
            }
            .navigationTitle("Thêm bé")
            .navigationBarItems(leading: Button("Thêm") {
                
            }, trailing: Button("Hủy") {
                showView.toggle()
            })
        }
    }
}

struct CreateCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomerView(showView: .constant(false))
    }
}
