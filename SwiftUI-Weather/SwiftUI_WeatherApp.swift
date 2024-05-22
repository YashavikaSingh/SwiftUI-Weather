//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by Yashavika Singh on 22.05.24.
//

import SwiftUI

@main
struct SwiftUI_WeatherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
