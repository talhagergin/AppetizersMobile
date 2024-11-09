//
//  LoadingView.swift
//  Appetizers
//
//  Created by Talha Gergin on 24.10.2024.
//

import SwiftUI
//while page loads
struct ActivityIndicator: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimar
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
}
struct LoadingView: View {
        var body: some View {
            ZStack{
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                ActivityIndicator()
            }
        }
    }
    

