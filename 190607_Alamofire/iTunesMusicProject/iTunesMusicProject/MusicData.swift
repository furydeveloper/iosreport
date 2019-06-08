//
//  MusicData.swift
//  iTunesMusicProject
//
//  Created by Fury on 07/06/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

struct Music: Decodable {
    let results: [MusicData]
    
//    enum CodingKeys: String, CodingKey {
//        case results
//    }
}

struct MusicData: Decodable {
    var artistName: String
    var artworkUrl100: String
    var trackName: String
    
//    enum CodingKeys: String, CodingKey {
//        case artistName
//        case artworkUrl100
//        case trackName
//    }
}
