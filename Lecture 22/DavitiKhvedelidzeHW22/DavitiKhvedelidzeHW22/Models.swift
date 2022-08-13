//
//  Models.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

struct DataResponse: Codable {
    
    struct Movie: Codable {
        
//        enum CodingKeys: String, CodingKey {
//            case id
//            case name
//            case overview
//            case poster_path = "imageUrl"
//            case vote_average = "rating"
//        }
        
        let id: Int
        let name: String
        let overview: String
        let poster_path: String
        let vote_average: Double
        
    }
    
    struct Session: Codable {
        let guest_session_id: String
    }
    
    let results: [Movie]
}
