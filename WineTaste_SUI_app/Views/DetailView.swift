//
//  DetailView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 19/11/2020.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    var wineCatalogue: WineBotttle
    
    @Binding var image: UIImage?
    @State var showingImagePicker = false //will not be presented

    var body: some View {
        VStack(alignment: .leading) {
            TitleAndBrandStack(
                wineCatalogue: wineCatalogue,
                titleFont: .title,
                brandFont: .title2
            )

            VStack {
                WineBotttle.Image(title: wineCatalogue.name)
                
                Button("Update the image") { showingImagePicker = true
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image) // var image: UIImage?
        } //space from borders
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(wineCatalogue: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
