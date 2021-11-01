//
//  SaleItemsList.swift
//  Topchik
//
//  Created by Andrey Sinyagin on 26.03.2021.
//

import SwiftUI

struct SaleItemsList: View {
    var items: [SaleItem]
    
    var body: some View {
        List(items) { item in
            VStack {
                HStack {
                    Text("\(item.supplierArticle)")
                        .font(.title2)
                    Spacer()
                    Text("\(item.techSize)")
                }
                .padding(2)
                HStack {
                    VStack(alignment: .leading) {
                        if item.finishedPrice < 0 {
                            Text("Возврат")
                                .font(.title2)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 7))
                        }
                        Text("Итоговая цена: \(item.finishedPrice, specifier: "%g")р.")
                        Text("Вознаграждение: \(item.forPay, specifier: "%g")р.")
                        Text("Место доставки: \(item.regionName)")
                        //Text("\()")
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\(item.lastChangeDateFormatted)")
                        .font(.title2)
                        .padding(2)
                }
            }
            
        }
    }
}

struct SaleItemsList_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = SaleItem(date: "2021-03-25T08:48:29",
                            lastChangeDate: "2021-03-25T08:58:29",
                            supplierArticle: "TRO003Бирюзовый",
                            techSize: "46-48",
                            quantity: 5,
                            totalPrice: 7860,
                            discountPercent: 40,
                            promoCodeDiscount: 30,
                            warehouseName: "Подольск",
                            countryName: "Россия",
                            oblastOkrugName: "Дальневосточный федеральный округ",
                            regionName: "Питкярантский",
                            forPay: 1400.5,
                            finishedPrice: 7823,
                            priceWithDisc: 7823.5)
        
        SaleItemsList(items: [item, item, item])
            .preferredColorScheme(.dark)
    }
}
