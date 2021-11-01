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
                if !viewModel.systemMessages.isEmpty {
                    VStack {
                        SystemMessagesList(messages: viewModel.systemMessages)
                    }
                } else {
                    //Text("success! items: \(saleItems.count)")
                    SaleItemsList(items: viewModel.saleItems)
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
