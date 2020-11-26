//
//  DetailView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 19/11/2020.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    var wineCatalogue: WineBottle
    
    @Binding var image: UIImage?
    @State var showingImagePicker = false //will not be presented
    @State var deletingImage = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack (spacing: 16) {
                CollectionBookmarkButton(wineCatalogue: wineCatalogue)
                TitleAndBrandStack(
                    wineCatalogue: wineCatalogue,
                    titleFont: .title,
                    brandFont: .title2
                )
            }
            
            VStack {
                WineBottle.Image(
                    uiImage: image,
                    title: wineCatalogue.name,
                    cornerRadius: 16
                )
                .scaledToFit()
                
                //update button will show without delete button when
                let updateButton = Button("Update image") { showingImagePicker = true
                }
                .padding()
                
                if image != nil {
                    HStack {
                        
                        Spacer()
                        //delete button will show only when there is an image
                        Button("Delete image") {
                            deletingImage = true
                            
                        }
                        Spacer()
                        
                        updateButton
                        
                        Spacer()
                    }
                } else {
                    updateButton
                }
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image) // var image: UIImage?
        } //space from borders
        //alert when the user would like to replace the picture
        
        .alert(isPresented: $deletingImage) {
            .init(
                title: .init("Delete image for \(wineCatalogue.name)?"), primaryButton: .destructive(.init("Delete")) {
                    image = nil
                },
                secondaryButton: .cancel())
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(wineCatalogue: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
