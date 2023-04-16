//
//  ReportView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 10/04/2023.
//

import SwiftUI

struct ReportView: View {
    @State var selectedTime: Time = .today
    @ObservedObject var viewModel: ReportViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text("Báo cáo doanh thu")
                    .font(.title)
                    .padding([.bottom], 20)
                
                Picker("Time", selection: $selectedTime){
                    ForEach(Time.allCases, content: { time in
                        Text(time.rawValue)
                    })
                }
                .pickerStyle(.segmented)
                .padding([.bottom], 10)
                
                let widthCard = proxy.size.width/2 - 50
                HStack {
                    ReportCardView(title: "Doanh thu", value: viewModel.revenue, backgroundColor: Color.green, width: widthCard)
                    Spacer()
                    ReportCardView(title: "Lượt bơi", value: viewModel.revenue, backgroundColor: Color.blue, width: widthCard)
                }
                
                HStack {
                    ReportCardView(title: "Số gói mới", value: viewModel.revenue, backgroundColor: Color.blue, width: widthCard)
                    Spacer()
                    ReportCardView(title: "Thông tin", value: viewModel.revenue, backgroundColor: Color.blue, width: widthCard)
                }
                
//                Text("Doanh thu theo \(viewModel.titleRevenueType)")
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(viewModel: ReportViewModel())
    }
}

enum Time: String, CaseIterable, Identifiable {
    case today, week, month, all
    var id: Self {self}
}

struct ReportCardView: View {
    var title = "Title"
    var value = 0
    var backgroundColor = Color.white
    var width: CGFloat = 50
    
    var body: some View {
        VStack {
            Label(title, systemImage: "dollarsign.circle")
                .font(.title2)
            Text(value.description)
                .font(.title)
        }
        .frame(width: width, height: 40)
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
        .foregroundColor(Color.white)
    }
}
