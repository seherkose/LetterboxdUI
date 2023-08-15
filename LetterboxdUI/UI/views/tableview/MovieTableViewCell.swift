//
//  MovieTableViewCell.swift
//  LetterboxdUI
//
//  Created by Seher Köse on 12.08.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movieData: MovieData?

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        if let movieData = movieData {
               let movieImageName = movieData.movieImage[indexPath.row]
               cell.movieImage.image = UIImage(named: movieImageName)
               cell.layer.borderColor = UIColor.lightGray.cgColor
               cell.layer.borderWidth = 0.5
               cell.layer.cornerRadius = 10
           }
        return cell
    }
    
    
}


