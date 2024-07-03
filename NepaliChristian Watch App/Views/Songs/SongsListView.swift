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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(songs.keys.sorted(using: .localizedStandard)), id: \.self) { key in
                    NavigationLink {
                        
                    } label: {
                        Section {
                            VStack(alignment: .leading) {
                                Text(key)
                                    .font(.system(size: 12))
                                Text("Content")
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SongsListView(songs: rawData.hymns)
            .navigationTitle("Hymns")
    }
}
