//
//  ListModel.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import Combine

class WineBottle: ObservableObject {
    
    @Published var name: String
    @Published var brand: String
    @Published var year: String
    @Published var type: String
    @Published var review: String
    @Published var haveInCollection: Bool
    
    init(title: String = "Denumire vin", brand: String = "Chateau Brand", review: String = "", year: String = "", type: String = "", haveInCollection: Bool = false ) {
        self.name = title
        self.brand = brand
        self.review = review
        self.year = year
        self.type = type

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
