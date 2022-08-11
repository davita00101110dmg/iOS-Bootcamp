//
//  Models.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

struct Country: Codable {
    let name: String
    let capital: String?
    let region: String
    let population: Int
    let flags: Flag
    let independent: Bool
}

struct Flag: Codable {
    let png: String
}
