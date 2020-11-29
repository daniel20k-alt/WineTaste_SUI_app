//
//  ReviewAndImageStack.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 29/11/2020.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct ReviewAndImageStack: View {
    @ObservedObject var wineCatalogue: WineBottle
    @Binding var image: UIImage?
    @State var showingImagePicker = false //will not be presented
    @State var deletingImage = false
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)
            TextField("Impresiile tale despre vin", text: $wineCatalogue.review)
            Divider()
                .padding(.vertical)
            
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
            Spacer()
        }
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

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(wineCatalogue: .init(), image: .constant(nil))
            .padding(.horizontal)
            .previewedInAllColorSchemes
    }
}
