//
//  SongsListView.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 03/07/2024.
//

import SwiftUI
import OrderedCollections

struct SongsListView: View {
    let songs: [String : Song]
    let prefix: String
    
    @EnvironmentObject var appState: AppState;
    
    private func navigationCard(_ key: String) -> some View {
        return Section {
            VStack(alignment: .leading) {
                Text(key)
                    .font(.system(size: 12))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(songs[key]?.title ?? "N/A")
                    .font(.system(size: 14))
            }
            
        }
    }
    
    var body: some View {

            List {
                ForEach(Array(songs.keys.sorted(using: .localizedStandard)), id: \.self) { key in
                    NavigationLink(value: "\(key)") {
                            navigationCard(key)
                    }

                }
            }
            .navigationDestination(for: String.self) { i in
                SongView(song: songs[i]!)
                    .navigationTitle(songs[i]!.title)
            }
            .toolbar {
                TextFieldLink {
                    Text("Go To")
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.primary)
                } onSubmit: { value in
                    if let val = songs[prefix + value] {
                        appState.path.append(prefix + value)
                    }
                }
               
            }
        
    }
}

#Preview {
    NavigationStack {
        SongsListView(songs: rawData.hymns, prefix: "B")
            .navigationTitle("Hymns")
    }
}
