//
//  Models.swift
//  DavitiKhvedelidzeHW23
//
//  Created by Dato Khvedelidze on 16.08.22.
//

import UIKit

struct NetworkService {
    
    static let shared = NetworkService()
    
    private let baseUrl = "https://api.themoviedb.org/3/tv/"
    private let urlQuery = [URLQueryItem(name: "api_key", value: "036b7ff90b99f9de8cc6bd344efd7450")]
    
    // Function to fetch "top_rated" and "similar" movies
    func fetchMovies(with endpoint: String) async -> Result<DataResponse, Error> {
        var urlComponents = URLComponents(string: baseUrl + endpoint)
        
        urlComponents?.queryItems = urlQuery
        
        guard let url = urlComponents?.url else {
            return .failure(MyError.requestError)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let movies = try JSONDecoder().decode(DataResponse.self, from: data)
            return .success(movies)
        }
        
        catch {
            return .failure(MyError.decodingError)
        }

    }
    
    // Function to fetch one movie with its details with passed ID
    func fetchMovieDetails(endpoint: String) async -> Result<DataResponse.MovieDetails, Error> {
        var urlComponents = URLComponents(string: baseUrl + endpoint)
        
        urlComponents?.queryItems = urlQuery
        
        guard let url = urlComponents?.url else {
            return .failure(MyError.requestError)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let movie = try JSONDecoder().decode(DataResponse.MovieDetails.self, from: data)
            return .success(movie)
        }
        
        catch {
            return .failure(MyError.decodingError)
        }
    }

    

}
