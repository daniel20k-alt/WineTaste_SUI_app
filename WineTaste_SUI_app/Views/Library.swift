//
//  Library.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 18/11/2020.
//

import class UIKit.UIImage
import Combine


class Library: ObservableObject {
    var sortedWines: [WineBottle] { itemsCashe}
    
    //allowing the user to create its own library
    /// adds the user's book at the top

    func addNewBottle(_ bottle: WineBottle, image: UIImage?) {
        itemsCashe.insert(bottle, at: 0)
        uiImages[bottle] = image
        
    }
    
    //the items that are already stored in the app's memory
    
   @Published private var itemsCashe: [WineBottle] = [
    
        .init(title: "Cabernet", brand: "Purcari", year: "An: 2016", type: "Alb-Sec"),
        .init(title: "Cahor", brand: "Bostavan"),
        .init(title: "Shiraz", brand: "Vartely"),
        .init(title: "Shiraz", brand: "Vartely2"),
        .init(title: "Shiraz", brand: "Vartely3"),
        .init(title: "Shiraz", brand: "Vartely4"),
        .init(title: "Shiraz", brand: "Vartely5"),
        .init(title: "Shiraz", brand: "Vartely6"),
        .init(title: "Shiraz", brand: "Vartely7")
    ]
    
    @Published var uiImages: [WineBottle: UIImage] = [:]
    
}
