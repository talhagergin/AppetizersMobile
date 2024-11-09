//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Talha Gergin on 13.10.2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack{
            NavigationStack {
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView() // it will be easier on iOS 18 We can use ProgressView()
            }
           
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

#Preview {
    AppetizerListView()
}
