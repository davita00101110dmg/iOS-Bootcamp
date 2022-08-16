//
//  Models.swift
//  DavitiKhvedelidzeHW23
//
//  Created by Dato Khvedelidze on 16.08.22.
//

import UIKit


enum MyError: String, Error {
    case requestError = "Request error"
    case decodingError = "Error while decoding JSON"
}

struct DataResponse: Codable {
    
    struct Movie: Codable {
        
        let id: Int
        let name: String
        
    }
    
    struct MovieDetails: Codable {
        let name: String
        let number_of_episodes: Int
    }
    
    let results: [Movie]

}
