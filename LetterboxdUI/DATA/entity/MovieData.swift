//

//  LetterboxdUI
//
//  Created by Seher Köse on 12.08.2023.
//

import Foundation

class MovieData {
    
    var sectionType:String?
    var movies:[String]
    var movieImage:[String]
    
    init(sectionType: String, movies: [String], movieImage: [String]) {
        self.sectionType = sectionType
        self.movies = movies
        self.movieImage = movieImage
    }

}


