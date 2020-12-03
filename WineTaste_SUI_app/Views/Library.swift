//
//  Library.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 18/11/2020.
//

import class UIKit.UIImage
import Combine

enum Section: CaseIterable {
   case inStore
   case inCollection
}


final class Library: ObservableObject {
    var sortedWines: [WineBottle] { itemsCashe}
    
    var manuallySortedBottles: [Section: [WineBottle]] {
        Dictionary(grouping: itemsCashe, by: \.haveInCollection)
            .mapKeys(Section.init)
    }
    
    //allowing the user to create its own library
    /// adds the user's book at the top

    func addNewBottle(_ bottle: WineBottle, image: UIImage?) {
        itemsCashe.insert(bottle, at: 0)
        uiImages[bottle] = image
        
    }
    
    
    @Published var uiImages: [WineBottle: UIImage] = [:]
    
    //the items that are already stored in the app's memory
    
   @Published private var itemsCashe: [WineBottle] = [
    
        .init(title: "Cabernet", brand: "Purcari", year: "An: 2016", type: "Alb-Sec"),
    .init(title: "Cahor", brand: "Bostavan", review: "test1 text"),
    .init(title: "Shiraz", brand: "Vartely", year: "An: 2018", type: "Rosu-Sec"),
        .init(title: "Shiraz", brand: "Vartely2"),
        .init(title: "Shiraz", brand: "Vartely3"),
        .init(title: "Shiraz", brand: "Vartely4"),
        .init(title: "Shiraz", brand: "Vartely5"),
        .init(title: "Shiraz", brand: "Vartely6"),
        .init(title: "Shiraz", brand: "Vartely7")
    ]
}

// MARK: - private

private extension Section {
    init(inStore: Bool) {
        self = inStore ? .inStore : .inCollection
    }
}

private extension Dictionary {
    // parameter accepts eac key of dictionary and return a key for new dictionary
    // postcondition = the collection of transformed keys must not contain duplicates
    func mapKeys<Transformed>(
      _ transform: (Key) throws -> Transformed
    ) rethrows -> [Transformed: Value] {
      .init(
        uniqueKeysWithValues: try map { (try transform($0.key), $0.value) }
      )
    }
  }
