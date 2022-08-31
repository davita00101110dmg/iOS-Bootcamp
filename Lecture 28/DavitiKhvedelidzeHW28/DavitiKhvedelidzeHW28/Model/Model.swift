//
//  Model.swift
//  DavitiKhvedelidzeHW28
//
//  Created by Dato Khvedelidze on 30.08.22.
//

import Foundation

struct City: Decodable {
    
    struct Weather: Decodable {
        let temp: Double
    }
    
    let name: String
    let main: Weather
}
