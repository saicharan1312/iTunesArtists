//
//  ViewModel.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/14/24.
//

import Foundation
/*
 class ViewModel {
 var artistData: [Artists] = []
 func fetchData () {
 APIManager.sharedInstance.fetchDataFromAPI(model: ArtistsInfo.self, url: Urls.artistDataUrl.rawValue) { data in
 self.artistData = data.results
 }
 }
 }*/

//class APICallforData {
//    var artistData: [Artists] = []
//    func fetchData(completion: @escaping ()->()) {
//        APIManager.sharedInstance.fetchDataFromAPI(for: ArtistsInfo.self , url: Urls.artistDataUrl.rawValue) { data, error in
//            if error != nil {
//                print("Error found: \(String(describing: error))")
//                completion()
//            }
//            if let data = data {
//                self.artistData = data.results
//                print(self.artistData)
//                completion()
//            }
//        }
//    }
//}
//
//class APICallforImage {
//    var artistImage: ArtWork?
//    func fetchData(completion: @escaping ()->()) {
//        APIManager.sharedInstance.fetchDataFromAPI(for: ArtWork.self , url: Urls.artistDataUrl.rawValue) { data, error in
//            if error != nil {
//                print("Error found: \(String(describing: error))")
//                completion()
//            }
//            if let data = data {
//                self.artistImage = data
//                print(self.artistImage ?? "None")
//                completion()
//            }
//        }
//    }
//}
