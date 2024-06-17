//
//  ViewController.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/3/24.
//

import UIKit

class ArtistViewController: UIViewController {
    
    @IBOutlet weak var artistTableView: UITableView!
    var artistData: [Artists] = []
    //var artistArr : Array<Artists> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
        dataFetch()
        }
    
    func tableInit() {
      //  artistTableView.delegate = self
        artistTableView.dataSource = self
        
    }

}
//MARK: - Network Call

extension ArtistViewController {
    func dataFetch() {
        let dataClosure: ((Data?) -> ())  = { data in
            guard let serverData = data else {
                print(Cautions.invalidServer.rawValue)
                return
            }
            
            do {
                let artistInfo = try JSONDecoder().decode(ArtistsInfo.self, from: serverData)
                self.artistData = artistInfo.results
                self.refreshTable()
            } catch let error {
                print(Cautions.error.rawValue, error)
            }
        }
        APIManager.sharedInstance.fetchDataFromAPI(url: dataUrl, closure: dataClosure)
    }
    
    func refreshTable() {
        DispatchQueue.main.async {
            self.artistTableView.reloadData()
        }
    }
}



