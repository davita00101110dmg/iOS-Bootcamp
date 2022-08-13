//
//  NetworkService.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import Foundation

class NetworkService {
    
    func getData<T: Codable>(with urlString: String, query: [URLQueryItem], completionHandler: @escaping (T) -> (Void)) {
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = query
        
        guard let url = urlComponents?.url else {
            // url error
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("url error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("response error")
                return
            }
            
            guard let data = data else {
                print("data error")
                return
            }
            
            if let dataSummary = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completionHandler(dataSummary)
                }
            }
            
            
        }
        
        task.resume()
        
    }
    
//    func postData<T: Codable>(urlString: String, query: [URLQueryItem], rating: Double) {
//        
//        let url = URL(string: urlString)!
//        
//        var request = URLRequest(url: url)
//        
//        request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        
//        let parameters: [String: Any] = [
//            "value": rating
//        ]
//    }
}
