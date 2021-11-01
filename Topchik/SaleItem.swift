//
//  SaleItem.swift
//  wbSales
//
//  Created by Andrey Sinyagin on 12.03.2021.
//

import Foundation

struct SaleItem: Decodable, Identifiable, Equatable {
    var id = UUID()
    
    var date: String
    var lastChangeDate: String
    var supplierArticle: String
    var techSize: String
    var quantity: Int
    var totalPrice: Int
    var discountPercent: Int
    var promoCodeDiscount: Int
    
    var warehouseName: String
    var countryName: String
    var oblastOkrugName: String
    var regionName: String

    var forPay: Double
    var finishedPrice: Double
    var priceWithDisc: Double
    
    var lastChangeDateFormatted: String {
        return removeTChar(date: lastChangeDate)
    }
    var time: String {
        return getTimeFromDate(date: date)
    }
    var lastChangeTime: String {
        return getTimeFromDate(date: lastChangeDate)
    }

    
        
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case lastChangeDate = "lastChangeDate"
        case supplierArticle = "supplierArticle"
        case techSize = "techSize"
        case quantity = "quantity"
        case totalPrice = "totalPrice"
        case discountPercent = "discountPercent"
        case promoCodeDiscount = "promoCodeDiscount"
        
        case warehouseName = "warehouseName"
        case countryName = "countryName"
        case oblastOkrugName = "oblastOkrugName"
        case regionName = "regionName"
        
        case forPay = "forPay"
        case finishedPrice = "finishedPrice"
        case priceWithDisc = "priceWithDisc"

    }
    
    func removeTChar(date: String) -> String {
        return date.replacingOccurrences(of: "T", with: "  ")
    }
    
    func getTimeFromDate(date: String) -> String {
        let split = date.components(separatedBy: "T")
        let timeWithSeconds = split.last ?? date
        
        return timeWithSeconds
    }

}

/*
    Структура объекта.
    https://suppliers-stats.wildberries.ru/api/v1/supplier/sales?dateFrom=2021-03-11T21:00:00.000Z&key=ZDRkMTI0MTktNzRlMi00NTZiLTlmMmMtZDAyNDM3MGE0ZDIx
 
     number    ""
        date    "2021-03-12T12:16:50"
        lastChangeDate    "2021-03-12T12:29:15"
        supplierArticle    "TRO002Темно-красный"
        techSize    "M"
     barcode    "2001254023072"
        quantity    1
        totalPrice    1500
        discountPercent    75
     isSupply    false
     isRealization    true
     orderId    19358460927
        promoCodeDiscount    45
        warehouseName    "Подольск"
        countryName    "Россия"
        oblastOkrugName    "Центральный федеральный округ"
        regionName    "Москва"
     incomeID    2061411
     saleID    "S1280428819"
     odid    100358517494
     spp    0
        forPay    175.31
        finishedPrice    206
        priceWithDisc    206.25
     nmId    19455775
     subject    "Трусы"
     category    "Белье"
     brand    "SteemeX"
     IsStorno    0
     gNumber    "9159503991285083592"
 */
