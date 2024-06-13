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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
    }
    func tableInit() {
        artistTableView.delegate = self
        artistTableView.dataSource = self
        dataFetch()
    }
}

    //MARK: TableView extension
extension ArtistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artistTableView.dequeueReusableCell(withIdentifier: TableViewCellId.id1.rawValue, for: indexPath) as! ArtistTableViewCell
        let info = artistData[indexPath.row]
        cell.setData(dataInput: info)
        return cell
    }
}


//MARK: - Network Call

extension ArtistViewController {
    func dataFetch() {
        let dataClosure: ((Data?) -> ())  = { [weak self] data in
            guard let serverData = data else {
                print(Cautions.invalidServer.rawValue)
                return
                }
            
            do {
                let artistInfo = try JSONDecoder().decode(ArtistsInfo.self, from: serverData)
                print(artistInfo)
                self?.artistData = artistInfo.results
                self?.refreshTable()
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



