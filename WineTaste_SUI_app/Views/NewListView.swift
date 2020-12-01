//
//  NewListView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 29/11/2020.
//

import SwiftUI

struct NewListView: View {
    
    @ObservedObject var wineBottle = WineBottle(title: "", brand: "")
    @State var image: UIImage? = nil
    @EnvironmentObject var library: Library
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                TextField("Name", text: $wineBottle.name)
                TextField("Brand", text: $wineBottle.brand)
                ReviewAndImageStack(wineCatalogue: wineBottle, image: $image)
            }
            .padding()
            .navigationBarTitle("Adding a new bottle")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to the collection") {
                        library.addNewBottle(wineBottle, image: image)
                        presentationMode.wrappedValue.dismiss()
                        
                    }//disable button if either name or brand is empty
                    .disabled([wineBottle.name, wineBottle.brand].contains(where: \.isEmpty))
                }
            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView().environmentObject(Library())
    }
}
