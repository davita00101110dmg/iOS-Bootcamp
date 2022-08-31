//
//  APIError.swift
//  DavitiKhvedelidzeHW28
//
//  Created by Dato Khvedelidze on 30.08.22.
//

import Foundation

enum ApiError: Error {
    case invalidUrlError
    case requestError
    case decodingError
}
