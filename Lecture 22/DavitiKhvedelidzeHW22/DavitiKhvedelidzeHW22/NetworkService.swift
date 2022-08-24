//
//  NetworkService.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private init () {}
    
    func getData<T: Codable>(with urlString: String, completionHandler: @escaping (T) -> (Void)) {
        
        var urlComponents = URLComponents(string: urlString)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "036b7ff90b99f9de8cc6bd344efd7450")
        ]
        
        guard let url = urlComponents?.url else {
            print("Problem with URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print(error!.localizedDescription)
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
            
            
        }
        
        task.resume()
        
    }
    
    //MARK: Doesn't work for now
    func postData(urlString: String, query: [URLQueryItem], rating: Double) {
        
        guard let url = URL(string: urlString) else {
            print("Problm with URL")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "value": rating
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print(error!.localizedDescription)
                return
            }

            do {
                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                
                print("Success: ", response)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
