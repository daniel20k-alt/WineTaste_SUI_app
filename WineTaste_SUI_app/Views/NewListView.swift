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
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Name", text: $wineBottle.name)
            TextField("Brand", text: $wineBottle.brand)
            ReviewAndImageStack(wineCatalogue: wineBottle, image: $image)
        }
        .padding()
        
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
