//
//  ContentViewModel.swift
//  Topchik
//
//  Created by Andrey Sinyagin on 01.11.2021.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var systemMessages = [String]()
    @Published var saleItems = [SaleItem]()
 
    func getSaleItems() {
        DispatchQueue.main.async {
            self.systemMessages.removeAll()
        }
        systemMessage(text: "getting SaleItems")
        let key = "ZDRkMTI0MTktNzRlMi00NTZiLTlmMmMtZDAyNDM3MGE0ZDIx"
        let urlString = "https://suppliers-stats.wildberries.ru/api/v1/supplier/sales?dateFrom=2021-03-24T21:00:00.000Z&flag=0&key=\(key)"
        let url = URL(string: urlString)!
        
        systemMessage(text: "starting URLSession")
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                self.systemMessage(text: "data received")

//                let jsonString = String(data: data, encoding: .utf8) ?? "json decoding error"
//                systemMessage(text: jsonString)
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([SaleItem].self, from: data)
                    self.systemMessage(text: "data decoded")
                    self.systemMessage(text: "items: \(decodedData.count)")
                    
                    sleep(2)
                    DispatchQueue.main.async {
                        self.systemMessages.removeAll()
                        self.saleItems = decodedData.reversed()
                    }
                    
                } catch {
                    self.systemMessage(text: "error decoding data")
                    self.systemMessage(text: error.localizedDescription)
                    self.systemMessage(text: "скорее всего ебет мозги сервер wb")
                    self.systemMessage(text: "нужно подождать секунд 5-10")
                }
                
            } else {
                self.systemMessage(text: "no data received")
                self.systemMessage(text: error!.localizedDescription)
                self.systemMessage(text: "хуй знает почему так")
            }
        }.resume()
    }
    
    func systemMessage(text: String) {
        //print("System message: \(text)")
        DispatchQueue.main.async {
            self.systemMessages.append(text)
        }
    }

    
}
