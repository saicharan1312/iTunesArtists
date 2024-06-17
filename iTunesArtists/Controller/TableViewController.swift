//
//  TableViewController.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/14/24.
//

import Foundation
import UIKit

//MARK: TableView extension
extension ArtistViewController: UITableViewDataSource {
    
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
