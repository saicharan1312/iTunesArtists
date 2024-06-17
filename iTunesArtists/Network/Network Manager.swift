//
//  Network Manager.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/12/24.
//

import Foundation

class APIManager {
    static let sharedInstance = APIManager()

    func fetchDataFromAPI(url: String, closure: @escaping ((Data?)->())) {
        guard let newUrl = URL(string: url) else {
            print(Cautions.invalid.rawValue)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: newUrl)) { data, url, error in
            if error != nil {
                print(Cautions.dataError.rawValue)
            }

         closure(data)

        }.resume()
    }
}

//class APIManager {
//    static let sharedInstance = APIManager()
//
//    func fetchDataFromAPI<T: Codable>(for: T.Type, url: String, completion: @escaping (T?,Error?)->()) {
//        guard let newUrl = URL(string: url) else {
//            print(Cautions.invalid.rawValue)
//            return
//        }
//        URLSession.shared.dataTask(with: URLRequest(url: newUrl)) { data, url, error in
//            if error != nil {
//                print(Cautions.dataError.rawValue)
//                completion(nil,error)
//            }
//            if let serverData = data {
//                do {
//                    let decodedData = try JSONDecoder().decode(T.self, from: serverData)
//                    print("Data Decoded")
//                    completion(decodedData,nil)
//                }
//                catch {
//                    print("Error while decoding data")
//                    completion(nil,error)
//                }
//            }
//        }.resume()
//    }
//}

// MARK: ALAMOFIRE
//func getAPICall() {
//    Alamofire.request(Urls.artistDataUrl.rawValue).responseJSON { response in
//        print("displaying using alamofire")
//        print(response.request)
//        print(response.result)
//        if let json = response.result.value {
//            print(json)
//        }
//    }
//}
