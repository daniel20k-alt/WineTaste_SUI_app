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
            ListModel.Image(title: registru.title) //see ListViews for the view
            VStack(alignment: .leading) {
                Text(registru.title)
                    .font(.title2)
                Text(registru.brand)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .lineLimit(1) //scrollable
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




