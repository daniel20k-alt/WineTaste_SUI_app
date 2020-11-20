//
//  ContentView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 16/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//        NavigationView {
        List(Library().sortedItems, id: \.title) { registru in
            ListRow(registru: registru)
        }
        .navigationBarTitle("My Wine Collection")
//    }
        }
        }
}

struct ListRow: View {
    let registru: ListModel
    
    var body: some View {
        NavigationLink(
            destination: DetailView(registru: registru)
        ) {
        HStack {
            ListModel.Image(title: registru.title, size: 80) //see ListViews for the view
            TitleAndBrandStack(
                registru: registru,
                titleFont: .title2,
                brandFont: .title3
                ) //scrollable
                .lineLimit(1)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


