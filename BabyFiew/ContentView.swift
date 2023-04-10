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
            CalendarView()
                .tabItem {
                    Label("Lịch", systemImage: "calendar")
                }
            
            ReportView()
                .tabItem {
                    Label("Báo cáo", systemImage: "chart.xyaxis.line")
                }
            
            OrderView()
                .tabItem {
                    Label("Tạo đơn", systemImage: "plus.app")
                }
            
            SearchView()
                .tabItem {
                    Label("Tìm kiếm", systemImage: "magnifyingglass")
                }
            
            SettingView()
                .tabItem {
                    Label("Cài đặt", systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
