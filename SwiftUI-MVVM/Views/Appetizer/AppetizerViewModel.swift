//
//  AppetizerListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by pineone on 2021/11/26.
//

import Foundation

// final Keyword 쓰는 이유 : 상속 방지

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerModel] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
