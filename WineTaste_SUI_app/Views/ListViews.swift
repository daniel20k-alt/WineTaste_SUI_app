//
//  ListViews.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import SwiftUI

//when pressing on a title 
struct TitleAndBrandStack: View {
    let wineCatalogue: WineBotttle
    let titleFont: Font
    let brandFont: Font
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(wineCatalogue.name)
                .font(titleFont)
            Text(wineCatalogue.brand)
                .font(brandFont)
                .foregroundColor(.secondary)
        }
    }
}


extension WineBotttle {

    struct Image: View {
        let title: String
        var size: CGFloat?
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "bookmark")
                
                symbol //displayed in form of letter
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }

    }
}

//previewing the image only
struct List_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
                TitleAndBrandStack(
                    wineCatalogue: .init(),
                    titleFont: .title,
                    brandFont: .title2
                )
            WineBotttle.Image(title: WineBotttle().name) //l
            WineBotttle.Image(title: "test1")
            WineBotttle.Image(title: "2test")
    }
    }
}

//configuring the letter in the title
extension Image {
    init?(title: String) {
        guard let character = title.first,
              
       case let symbolName = "\(character.lowercased()).square",
        
        UIImage(systemName: symbolName) != nil else { return nil } //not allowing emojis
        
        self.init(systemName: symbolName)
    }
}
