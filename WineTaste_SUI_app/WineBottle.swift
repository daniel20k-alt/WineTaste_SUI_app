//
//  ListModel.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import Combine

class WineBottle: ObservableObject {
    
    let name: String
    let brand: String
    @Published var review: String
    @Published var haveInCollection: Bool
    
    init(title: String = "Denumire vin", brand: String = "Chateau Brand", review: String = "", haveInCollection: Bool = false) {
        self.name = title
        self.brand = brand
        self.review = review
        self.haveInCollection = haveInCollection
    }
}

//making Equatable and Hashable into extentions
extension WineBottle: Equatable {
    static func == (lhs: WineBottle, rhs: WineBottle) -> Bool {
        lhs === rhs
    }
}

extension WineBottle: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
