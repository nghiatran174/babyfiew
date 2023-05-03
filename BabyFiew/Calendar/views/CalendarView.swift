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
        ZStack(alignment: .bottomTrailing) {
            VStack {
                HStack {
                    ForEach(viewModel.days, id: \.day) {weekday in
                        VStack(spacing: 10) {
                            Text(weekday.weekday)
                                .font(.subheadline)
                            Text(String(weekday.day))
                                .padding(5)
                                .frame(width: 35, height: 35)
                                .background(viewModel.selectDay == weekday.day ? Color("pinkmain") : nil)
                                .foregroundColor(viewModel.selectDay == weekday.day ? Color.white : nil)
                                .cornerRadius(30)
                        }
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            viewModel.selectDay = weekday.day
                        }
                        .onChange(of: viewModel.selectDay) { _ in
                            viewModel.filterEvents()
                        }
                    }
                }
                
                List {
                    ForEach(viewModel.eventsOfSelectDay, id: \.date) { event in
                        HStack {
                            Text(event.getTime())
                                .padding(.horizontal, 15)
                            VStack {
                                HStack {
                                    Image(systemName: "person")
                                    VStack {
                                        Text(event.baby.nickName)
                                        Text(event.note)
                                    }
                                }
                                .padding(8)
                                .background(viewModel.backgroundColorEvents.randomElement())
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
                .task {
                    await viewModel.fetchEvents()
                }
                
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
        CalendarView(viewModel: CalendarViewModel(calendarServices: CalendarServicesMock()), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
