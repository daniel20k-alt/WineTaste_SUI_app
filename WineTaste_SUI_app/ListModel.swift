//
//  ListModel.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

struct ListModel {
    
    let title: String
    let brand: String
    
    init(title: String = "Denumire vin", brand: String = "Chateau Brand") {
        self.title = title
        self.brand = brand
    }
}
