//
//  PopularMovieCell.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 23.07.2022.
//

import UIKit
import SDWebImage

class PopularMovieCell: UICollectionViewCell {
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    func configure(movie: Movie) {
        print("AXAX configure")
        
        if let poster = movie.poster_path {
                    self.moviePoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(poster)"), completed: nil)
        }
    }
}
