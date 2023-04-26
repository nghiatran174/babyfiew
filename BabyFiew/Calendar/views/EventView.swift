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
    
    @State var text:String = ""
    @State var textEdit:String = "Ghi chú"
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Tên bé", text: $viewModel.eventBabyName)
//                        .disabled(true)
                        .onTapGesture {
                            viewModel.showSearch.toggle()
                        }
                    
                    DatePicker("Giờ hẹn",
                               selection: $viewModel.eventDate,
                               displayedComponents: [.hourAndMinute, .date])
                }
                Section {
                    TextEditor(text: $viewModel.eventNote)
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
                        
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showSearch, onDismiss: {
            if let selectBaby = searchViewModel.selectResultSearch {
                viewModel.eventBabyName = selectBaby.nickName
            }
        }) {
            SearchBabyEventView(searchViewModel: searchViewModel)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(viewModel: CalendarViewModel(), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
