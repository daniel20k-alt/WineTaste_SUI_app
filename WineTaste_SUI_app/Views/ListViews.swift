//
//  ListViews.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import SwiftUI

//when pressing on a title 
struct TitleAndBrandStack: View {
    let registru: ListModel
    let titleFont: Font
    let brandFont: Font
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(registru.title)
                .font(titleFont)
            Text(registru.brand)
                .font(brandFont)
                .foregroundColor(.secondary)
        }
    }
}


extension ListModel {

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
                    registru: .init(),
                    titleFont: .title,
                    brandFont: .title2
                )
            ListModel.Image(title: ListModel().title) //l
            ListModel.Image(title: "test1")
            ListModel.Image(title: "2test")
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
