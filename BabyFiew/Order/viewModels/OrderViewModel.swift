//
//  OrderViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import Foundation

protocol OrderFetcher {
    func fetchServices() async throws -> Service
    func addCustomer(baby: Baby) async throws -> Baby
    func saveOrder(customer: Customer, services: [Product], totalBill: Double) async throws -> Int
}

class OrderViewModel : ObservableObject {
    @Published var showSelectProducts: Bool = false
    @Published var showCreateCustomer: Bool = false
    @Published var showSearchCustomer: Bool = false
    @Published var newBaby: Baby = Baby()
    @Published var messageAlert = ""
    @Published var showAlert = false
    @Published var saveButtonDisabled = false
    @Published var saveButtonTitle = "Lưu"
    @Published var totalBill = 0.0
    @Published var customerSelected: Baby? = nil {
        didSet {
            checkOrderValid()
        }
    }
    @Published var services = Service() {
        didSet {
            checkOrderValid()
            totalBill = services.sumPrice
        }
    }
    
    
    private let orderServices: OrderFetcher
    
    init(orderServices: OrderFetcher) {
        self.orderServices = orderServices
    }
    
    func onAppearInit() {
        newBaby = Baby()
    }
    
    @MainActor func loadServices() {
        Task {
            do {
                services = try await orderServices.fetchServices()
            } catch {
                print("error")
            }
        }
    }
    
    @MainActor func addCustomer() {
        guard isCustomerValid() else {
            messageAlert = "Nhập đầy đủ thông tin"
            showAlert.toggle()
            return
        }
        
        Task {
            do {
                newBaby = try await orderServices.addCustomer(baby: newBaby)
                showCreateCustomer.toggle()
            } catch {
                print("error")
            }
        }
    }
    
    func saveOrder() {
        Task {
            do {
                let idOrder = try await orderServices.saveOrder(customer: customerSelected!.parent, services: services.servicesSelected, totalBill: totalBill)
                if idOrder > 0 {
                    saveButtonTitle = "Đã lưu"
                    saveButtonDisabled.toggle()
                }
            } catch {
                print("error")
            }
        }
    }
    
    private func isCustomerValid() -> Bool {
        if newBaby.name.isEmpty ||
           newBaby.nickName.isEmpty ||
           newBaby.parent.name.isEmpty ||
           newBaby.parent.phone.isEmpty {
            return false
        }
        return true
    }
    
    private func checkOrderValid() {
        if customerSelected == nil ||
            services.servicesSelected.isEmpty {
            saveButtonDisabled = true
        }else {
            saveButtonDisabled = false
        }
    }
}
