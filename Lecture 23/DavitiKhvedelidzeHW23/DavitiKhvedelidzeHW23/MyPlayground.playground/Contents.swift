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
    
    struct MovieDetails: Codable {
        let name: String
        let number_of_episodes: Int
    }
    
    let results: [Movie]
}


struct NetworkService {
    
    static let shared = NetworkService()
    
    private let baseUrl = "https://api.themoviedb.org/3/tv/"
    
    func getData<T: Codable>(endpoint: String, completionHandler: @escaping (T) -> (Void)) async {
        
        var urlComponents = URLComponents(string: baseUrl + endpoint)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "036b7ff90b99f9de8cc6bd344efd7450")
        ]
        
        guard let url = urlComponents?.url else {
            print("url error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
               (200...299).contains(httpResponse.statusCode) else {
                print("respose error")
                return
            }
            
            guard let data = data else {
                print("data error")
                return
            }

            do {
                let decoder = JSONDecoder()
                let dataSummary = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(dataSummary)
                }
            }
            
            catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
}

var networkService = NetworkService.shared

var moviess = [DataResponse.Movie]()
var similarMoviess = [DataResponse.Movie]()

func apiCalls()  {
    
    Task {
        
        await networkService.getData(endpoint: "top_rated") { (movies: DataResponse) in
            moviess = movies.results
            print(moviess)
        }
        
        let firstRandomMovie = moviess.randomElement()?.id
        
        await networkService.getData(endpoint: "\(String(describing: firstRandomMovie))/similar") { (movies: DataResponse) in
            similarMoviess = movies.results
        }
        
        let secondRandomMovie = similarMoviess.randomElement()?.id
        
        await networkService.getData(endpoint: "\(String(describing: secondRandomMovie))") { (movie: DataResponse.MovieDetails) in
            print("Movie \(movie.name) episodes: \(movie.number_of_episodes)")
        }
        
    }
    
}

apiCalls()
