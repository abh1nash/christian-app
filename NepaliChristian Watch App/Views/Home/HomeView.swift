//
//  HomeView.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 03/07/2024.
//

import SwiftUI

enum Screen {
    case hymns
    case chorus
    case children
}

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack(path: $appState.path) {
            VStack {
                NavigationLink(value: Screen.hymns) {
                    Text("Hymns")
                }
                NavigationLink(value: Screen.chorus) {
                    Text("Chorus")
                }
                NavigationLink(value: Screen.children) {
                    Text("Children Songs")
                }
            }
            .navigationDestination(for: Screen.self) { name in
                switch name {
                case Screen.hymns: SongsListView(songs: rawData.hymns, prefix: "B")
                    .navigationTitle("Hymns")
                case Screen.chorus: SongsListView(songs: rawData.chorus, prefix: "C")
                    .navigationTitle("Chorus")
                case Screen.children: SongsListView(songs: rawData.childrenChorus, prefix: "BC")
                    .navigationTitle("Children Songs")
                }
            }
        }

    }
}

#Preview {
    NavigationView {
        HomeView()
            .toolbar(.hidden)
    }
}
