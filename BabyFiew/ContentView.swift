//
//  ContentView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 06/04/2023.
//

import SwiftUI

struct ContentView: View {    
    @StateObject var loginViewModel = LoginViewModel(loginServices: LoginServicesMock())
    
    var body: some View {
        ZStack { 
            if loginViewModel.isLogin {
                LoginView()
                    .zIndex(1)
            }
            
            TabView {
                CalendarView(viewModel: CalendarViewModel(calendarServices: CalendarServicesMock()), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
                    .tabItem {
                        Label("Lịch", systemImage: "calendar")
                    }
                
                ReportView(viewModel: ReportViewModel())
                    .tabItem {
                        Label("Báo cáo", systemImage: "chart.xyaxis.line")
                    }
                
                OrderView(viewModel:
                            OrderViewModel(
                                orderServices: OrderMock()),
                            searchViewModel: SearchComponentViewModel(searcher: SearcherMock())
                    )
                    .tabItem {
                        Label("Tạo đơn", systemImage: "plus.app")
                    }
                
                SearchView(viewModel: SearchViewModel(), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
                    .tabItem {
                        Label("Tìm kiếm", systemImage: "magnifyingglass")
                    }
                
                SettingView()
                    .tabItem {
                        Label("Cài đặt", systemImage: "gearshape")
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(loginViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
