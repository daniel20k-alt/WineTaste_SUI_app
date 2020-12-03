//
//  ContentView.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 16/11/2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: Library
    @State var addingNewBottle: Bool = false
    
    var body: some View {
        NavigationView {
            //        NavigationView {
            List {
                Button {
                    addingNewBottle = true
                    
                } label: {
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 60))
                        Text("Add a new bottle")
                            .font(.title2)
                    }
                    
                    Spacer()
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.vertical, 10)
                .sheet(isPresented: $addingNewBottle,
                       content: NewListView.init)
            
                ForEach(Section.allCases, id: \.self) {
                    SectionView(section: $0)
                }
                
            }
        .navigationBarTitle("My Wine Collection")
        }
    }
}

private struct ListRow: View {
    let wineCatalogue: WineBottle
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink(
            destination: DetailView(wineCatalogue: wineCatalogue)
        ) {
            HStack {
                WineBottle.Image(
                    uiImage: library.uiImages[wineCatalogue],
                    title: wineCatalogue.name,
                    size: 80,
                    cornerRadius: 12) //see ListViews for the view
                TitleAndBrandStack(
                    wineCatalogue: wineCatalogue,
                    titleFont: .title2,
                    brandFont: .title3,
                    otherInfoFont: .title3,
                    typeFont: .title3
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


private struct SectionView: View {
    let section: Section
    @EnvironmentObject var library: Library
    
    var title: String {
        switch section {
        
        case .inStore:
            return "Not yet tried"
        case .inCollection:
            return "Already in collection"
        }
    }
    
    var body: some View {
        if let bottles = library.manuallySortedBottles[section] {
            SwiftUI.Section(header:
                ZStack {
                Image("LightTexture")
                                    .resizable()
                                    .scaledToFit()
                Text(title)
                    .font(.custom("American Typewriter", size: 25))

            }
            .listRowInsets(.init())
            ) {
                ForEach(bottles) {
                    ListRow(wineCatalogue: $0)
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewedInAllColorSchemes
    }
}


