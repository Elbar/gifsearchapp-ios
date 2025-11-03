//
//  GifSearchAppApp.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//

import SwiftUI

@main
struct GifSearchAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
