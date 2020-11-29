//
//  DetailView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 19/11/2020.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var wineCatalogue: WineBottle
    @Binding var image: UIImage?

    
    var body: some View {
        VStack(alignment: .leading) {
            HStack (spacing: 16) {
                CollectionBookmarkButton(wineCatalogue: wineCatalogue)
                TitleAndBrandStack(
                    wineCatalogue: wineCatalogue,
                    titleFont: .title,
                    brandFont: .title2,
                    otherInfoFont: .title2,
                    typeFont: .title3
                )
            }
            
            ReviewAndImageStack(wineCatalogue: wineCatalogue, image: $image)
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(wineCatalogue: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}

