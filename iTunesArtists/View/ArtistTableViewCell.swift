//
//  ArtistTableViewCell.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/12/24.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var genreNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        priceLabel.layer.borderColor = UIColor.blue.cgColor
        priceLabel.layer.borderWidth = 0.75
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(dataInput: Artists) {
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.darkGray.cgColor
        artistNameLabel.text = dataInput.artistName
        countryLabel.text = dataInput.country
        genreNameLabel.text = dataInput.primaryGenreName
        priceLabel.text = "$\(dataInput.collectionPrice )"
        
        APIManager.sharedInstance.fetchDataFromAPI(url: dataInput.artworkUrl60 ) { data in
            guard let recievedImage = data else {
                print(Cautions.invalidImage.rawValue)
                return
            }
            DispatchQueue.main.async {
                self.artistImage.image = UIImage(data: recievedImage)
            }
        }
    }
}
