//
//  ListModel.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

struct WineBotttle: Hashable {
    
    let name: String
    let brand: String
    
    init(title: String = "Denumire vin", brand: String = "Chateau Brand") {
        self.name = title
        self.brand = brand
    }
}
