//
//  ListViews.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 17/11/2020.
//

import SwiftUI

struct CollectionBookmarkButton: View {
    @ObservedObject var wineCatalogue: WineBottle
    
    var body: some View {
        let bookmark = "bookmark"
        
        Button {
            wineCatalogue.haveInCollection.toggle()
        } label: { //.fill if its true, otherwise simple bookmark
            Image(systemName:  wineCatalogue.haveInCollection ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .light))
        }
    }
}

//when pressing on a title 
struct TitleAndBrandStack: View {
    let wineCatalogue: WineBottle
    let titleFont: Font
    let brandFont: Font
    let otherInfoFont: Font
    let typeFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(wineCatalogue.name)
                .font(titleFont)
            Text(wineCatalogue.brand)
                .font(brandFont)
                .foregroundColor(.secondary)
            HStack {
                Text(wineCatalogue.year)
                .font(otherInfoFont)
                .foregroundColor(.primary)
                
            Text(wineCatalogue.type)
                .font(otherInfoFont)
                .foregroundColor(.secondary)
            }
        }
    }
}


extension WineBottle {
    struct Image: View {
        let uiImage: UIImage?
        let title: String
        var size: CGFloat?
        let cornerRadius: CGFloat
        
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
            } else {
                
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
}

//previewing the image only
struct List_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            HStack {
                CollectionBookmarkButton(wineCatalogue: .init()) //collection bookmark
                CollectionBookmarkButton(wineCatalogue: .init(haveInCollection: true)) //.filled
                
                TitleAndBrandStack(
                    wineCatalogue: .init(),
                    titleFont: .title,
                    brandFont: .title2,
                    otherInfoFont: .title2,
                    typeFont: .title3
                )
            }
            WineBottle.Image(title: WineBottle().name) //l
            WineBottle.Image(title: "test1")
            WineBottle.Image(title: "2test")
        }
        .previewedInAllColorSchemes
        
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


extension WineBottle.Image {
    //a preview image
    init(title: String) {
        self.init(
            uiImage: nil,
            title: title,
            cornerRadius: .init()
        )
    }
}

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(
            ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}
