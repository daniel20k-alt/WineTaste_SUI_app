//
//  ReadMeApp.swift
//  WineTaste_SUI_app
//
//  Created by DDDD on 01/12/2020.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Library())
        }
    }
}
