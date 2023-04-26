//
//  ContentView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 06/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView(viewModel: CalendarViewModel(), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
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
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
