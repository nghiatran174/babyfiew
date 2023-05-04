//
//  CreateCustomerView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 17/04/2023.
//

import SwiftUI

struct CreateCustomerView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section("Thông tin bố mẹ") {
                    TextField("Tên bố (mẹ)", text: $viewModel.newBaby.parent.name)
                    TextField("Số điện thoại", text: $viewModel.newBaby.parent.phone)
                }
                Section("Thông tin bé") {
                    TextField("Tên bé", text: $viewModel.newBaby.name)
                    TextField("Biệt danh bé", text: $viewModel.newBaby.nickName)
                    Picker("Giới tính", selection: $viewModel.newBaby.gender) {
                        Text(Gender.male.rawValue).tag(Gender.male)
                        Text(Gender.female.rawValue).tag(Gender.female)
                    }
                    .pickerStyle(.menu)
                    DatePicker("Ngày sinh", selection: $viewModel.newBaby.dateOfBirth,displayedComponents: [.date])
                }
            }
            .navigationTitle("Thêm bé")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Hủy") {
                viewModel.showCreateCustomer.toggle()
            }, trailing: Button("Thêm") {
                viewModel.addCustomer()
            })
            .alert(viewModel.messageAlert, isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel, action: {})
            }
            .onAppear {
                viewModel.onAppearInit()
            }
        }
    }
}

struct CreateCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomerView(viewModel: OrderViewModel(orderServices: OrderMock()))
    }
}
