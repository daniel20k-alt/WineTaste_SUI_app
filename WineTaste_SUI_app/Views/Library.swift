//
//  Library.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 18/11/2020.
//

import Foundation

struct Library {
    var sortedItems: [ListModel] { itemsCashe}
    
    
    private var itemsCashe: [ListModel] = [
    
        .init(title: "Cabernet", brand: "Purcari"),
        .init(title: "Cahor", brand: "Bostavan"),
        .init(title: "Shiraz", brand: "Vartely"),
        .init(title: "Shiraz", brand: "Vartely2"),
        .init(title: "Shiraz", brand: "Vartely3"),
        .init(title: "Shiraz", brand: "Vartely4"),
        .init(title: "Shiraz", brand: "Vartely5"),
        .init(title: "Shiraz", brand: "Vartely6"),
        .init(title: "Shiraz", brand: "Vartely7")
    ]
}
