//
//  CalendarView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 06/04/2023.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: CalendarViewModel
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    var body: some View {
        let days: [String] = ["T2","T3","T4","T5","T6","T7","CN"]
        
        ZStack(alignment: .bottomTrailing) {
            VStack {
                HStack {
                    ForEach(days, id: \.self) {day in
                        VStack(spacing: 10) {
                            Text(day)
                                .font(.subheadline)
                            Text("10")
                                .padding(5)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                
                List {
                    HStack {
                        Text("9:00")
                            .padding(.horizontal, 15)
                        VStack {
                            HStack {
                                Image(systemName: "person")
                                VStack {
                                    Text("Mia")
                                    Text("Thong tin gi do")
                                }
                            }
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    
                    HStack {
                        Text("9:00")
                            .padding(.horizontal, 15)
                        VStack {
                            HStack {
                                Image(systemName: "person")
                                VStack {
                                    Text("Mia")
                                    Text("Thong tin gi do")
                                }
                            }
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                .listStyle(.grouped)
                
                Spacer()
            }
            
            Button(action: {
                viewModel.showEventView.toggle()
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .padding()
                    .foregroundColor(Color("pinkmain"))
                    .background(Color("bluemain"))
                    .clipShape(Circle())
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.showEventView) {
            EventView(viewModel: viewModel, searchViewModel: searchViewModel)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewModel: CalendarViewModel(), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
