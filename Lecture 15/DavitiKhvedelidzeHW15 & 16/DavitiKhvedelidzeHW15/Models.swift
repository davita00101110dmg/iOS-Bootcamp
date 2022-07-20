//
//  Models.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import Foundation

enum Genre: String, CaseIterable {
    case action, drama, comedy
}

var genreToFilteryBy = "all"

struct Movie: Hashable {
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(title)
    }
    
    var uuid = UUID()
    
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    let seen: Bool
    var isFavourite: Bool
    let description: String
    let genre: Genre
 
    static var movies = [
        Movie(title: "Avatar", releaseDate: "2009", imdb: 7.9, mainActor: "Sam Worthington", seen: false, isFavourite: false, description: "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.", genre: .action),
        Movie(title: "I Am Legend", releaseDate: "2007", imdb: 7.2, mainActor: "Will Smith", seen: false, isFavourite: false, description: "Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.", genre: .drama),
        Movie(title: "The Wolf of Wall Street", releaseDate: "2013", imdb: 8.2, mainActor: "Leonardo DiCaprio", seen: true, isFavourite: true, description: "Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.", genre: .comedy),
        Movie(title: "Interstellar", releaseDate: "2014", imdb: 8.6, mainActor: "Matthew McConaughey", seen: true, isFavourite: true, description:"A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", genre: .drama),
        Movie(title: "The Avengers", releaseDate: "2012", imdb: 8.1, mainActor: "Robert Downey Jr.", seen: true, isFavourite: true, description: "Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity.", genre: .action)
    ]
}
