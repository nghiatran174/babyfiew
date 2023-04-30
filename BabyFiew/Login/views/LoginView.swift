//
//  LoginView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 29/04/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            Color("bluemain")
            Circle()
                .scale(1.2)
                .foregroundColor(.white)
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Username", text: $viewModel.userName)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.03))
                    .cornerRadius(10)
                    .border(.red, width: viewModel.wrongUser ? 1 : 0)
                    
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.03))
                    .cornerRadius(10)
                    .border(.red, width: viewModel.wrongUser ? 1 : 0)
                
                Button("Login") {
                    viewModel.login()
                }
                .foregroundColor(.white)
                .frame(width:300, height: 50)
                .background(Color("bluemain"))
                .cornerRadius(10)
                .disabled(viewModel.userName.isEmpty || viewModel.password.isEmpty)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel(loginServices: LoginServicesMock()))
    }
}
