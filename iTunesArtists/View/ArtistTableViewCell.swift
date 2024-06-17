//
//  ArtistTableViewCell.swift
//  iTunesArtists
//
//  Created by Sai Charan Thummalapudi on 6/12/24.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var genreNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        borderUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(dataInput: Artists) {
        artistNameLabel.text = dataInput.artistName
        countryLabel.text = dataInput.country
        genreNameLabel.text = dataInput.primaryGenreName
        if dataInput.collectionPrice == 0.0 {
            priceLabel.text = "Free"
        }
        else {
            priceLabel.text = "$\(dataInput.collectionPrice )"
        }
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
    
    func borderUI() {
        priceLabel.layer.borderColor = UIColor.blue.cgColor
        priceLabel.layer.borderWidth = 2
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
