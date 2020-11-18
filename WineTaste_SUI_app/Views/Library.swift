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
        .init(title: "Shiraz", brand: "Vartely")
    ]
}
