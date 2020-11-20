//
//  DetailView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 19/11/2020.
//

import SwiftUI

struct DetailView: View {
    var registru: ListModel
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndBrandStack(
                registru: registru,
                titleFont: .title,
                brandFont: .title2
            )
            ListModel.Image(title: registru.title)
            Spacer()
        }
        .padding() //space from borders
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(registru: .init())
    }
}
