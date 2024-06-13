//
//  Module.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/12/24.
//

import Foundation

struct Artists: Codable {
    let artistName: String
    let country: String
    let primaryGenreName: String
    let collectionPrice: Float
    let artworkUrl60: String
}

struct ArtistsInfo: Codable {
    let resultCount: Int
    let results:[Artists]
}







