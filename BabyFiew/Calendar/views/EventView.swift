//
//  EventView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 24/04/2023.
//

import SwiftUI

struct EventView: View {
    @ObservedObject var viewModel: CalendarViewModel
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Tên bé", text: $viewModel.newEvent.baby.nickName)
//                        .disabled(true)
                        .onTapGesture {
                            viewModel.showSearch.toggle()
                        }
                    
                    DatePicker("Giờ hẹn",
                               selection: $viewModel.newEvent.date,
                               displayedComponents: [.hourAndMinute, .date])
                }
                Section(header: Text("Ghi chú")) {
                    TextEditor(text: $viewModel.newEvent.note)
                }
            }
            .navigationTitle("Sự kiện mới")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Hủy") {
                        viewModel.showEventView.toggle()
                    }
                }
                ToolbarItem {
                    Button("Thêm") {
                        viewModel.addEvent()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showSearch, onDismiss: {
            if let selectBaby = searchViewModel.selectResultSearch {
                viewModel.newEvent.baby = selectBaby
            }
        }) {
            SearchBabyEventView(searchViewModel: searchViewModel)
        }
        .alert(viewModel.messageAlert, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(viewModel: CalendarViewModel(calendarServices: CalendarServicesMock()), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
