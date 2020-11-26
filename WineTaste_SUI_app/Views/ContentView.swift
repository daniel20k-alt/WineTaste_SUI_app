//
//  ContentView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 16/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    var body: some View {

        NavigationView {
            //        NavigationView {
            List(library.sortedWines) {
//                removed id: \.self since WineBottle conforms to identifiable
                wineCatalogue in
                ListRow(wineCatalogue: wineCatalogue,
                        image: $library.uiImages[wineCatalogue])
            }
            .navigationBarTitle("My Wine Collection")
            //    }
        }
    }
    
}

struct ListRow: View {
    let wineCatalogue: WineBottle
    @Binding var image: UIImage?
    
    
    var body: some View {
        NavigationLink(
            destination: DetailView(wineCatalogue: wineCatalogue, image: $image)
        ) {
            HStack {
                WineBottle.Image(
                    uiImage: image,
                    title: wineCatalogue.name,
                    size: 80,
                    cornerRadius: 12) //see ListViews for the view
                TitleAndBrandStack(
                    wineCatalogue: wineCatalogue,
                    titleFont: .title2,
                    brandFont: .title3
                ) //scrollable
                .lineLimit(1)
                 
                Spacer()
                //implementing the button in ContentView
                CollectionBookmarkButton(wineCatalogue: wineCatalogue)
                    //allowing button interaction
                    .buttonStyle(BorderlessButtonStyle())
                
            }
            .padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}


