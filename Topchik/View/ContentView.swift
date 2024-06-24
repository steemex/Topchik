//
//  ContentView.swift
//  Topchik
//
//  Created by Andrey Sinyagin on 26.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.systemMessages.isEmpty {
                    SaleItemsList(items: viewModel.saleItems)
                } else {
                    SystemMessagesList(messages: viewModel.systemMessages)
                }
                Button("Refresh") { viewModel.getSaleItems() }
                    .padding(5)
            }
            .navigationBarTitle("Topchik", displayMode: .inline)
            .onAppear(perform: viewModel.getSaleItems)
        }
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
