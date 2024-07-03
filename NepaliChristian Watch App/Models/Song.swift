//
//  Song.swift
//  NepaliChristian Watch App
//
//  Created by Abhinash Khatiwada on 03/07/2024.
//

import Foundation

struct Song: Decodable {
    let title: String
    let chunks: [Verse]
}

enum VerseType: String, Decodable {
    case chorus = "chorus"
    case verse = "verse"
}

struct Verse: Decodable, Hashable {
    let lines: [String]
    let type: VerseType
}
