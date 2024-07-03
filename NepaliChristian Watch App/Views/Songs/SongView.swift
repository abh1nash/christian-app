//
//  SongView.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 03/07/2024.
//

import SwiftUI

struct SongView: View {
    let song: Song
    var body: some View {
        ScrollView {
            ForEach(Array(song.chunks.enumerated()), id: \.offset) {
                cInd, chunk in VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(chunk.type == VerseType.chorus ? "C." : "\(cInd + 1).")
                        VStack(alignment: .leading) {
                            ForEach(Array(chunk.lines.enumerated()), id: \.offset) {
                                (lineIndex, _line) in
                                Text(_line.trimmingCharacters(in: .whitespacesAndNewlines))
                                    .font(.caption2)
                                    .fontWeight(chunk.type == VerseType.chorus ? .black : .regular)
                                    .padding(.bottom, 4)
                            }
                        }
                        .frame(
                              minWidth: 0,
                              maxWidth: .infinity,
                              minHeight: 0,
                              maxHeight: .infinity,
                              alignment: .topLeading
                            )
                    }
                    .padding(.bottom, 14)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        SongView(song: rawData.hymns["B291"]!)
            .navigationTitle(rawData.hymns["B291"]?.title ?? "Title")
    }
}
