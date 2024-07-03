//
//  NepaliChristianApp.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 03/07/2024.
//

import SwiftUI

final class AppState: ObservableObject {
    @Published var path = NavigationPath()
}

@main
struct NepaliChristian_Watch_AppApp: App {
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .environmentObject(appState)
    }
}
