//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Talha Gergin on 17.10.2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers{ [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
           
        }
    }
}
