//
//  ListViews.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import SwiftUI

extension ListModel {

    struct Image: View {
        let title: String
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "bookmark")
                
                symbol //displayed in form of letter
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }

    }
}

//previewing the image only
struct List_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
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
