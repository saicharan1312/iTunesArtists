//
//  Constant.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/12/24.
//

import Foundation

let dataUrl = "https://itunes.apple.com/search?term=a"

enum Cautions: String {
    case dataError = "Got error while extracting data"
    case invalid = "Invalid Error"
    case invalidServer = "Invalid server data"
    case error = "Unable to convert serialized object to model: "
    case invalidImage = "Invalid Image found"
}

enum TableViewCellId: String {
    case id1 = "ArtistTableViewCell"
}


