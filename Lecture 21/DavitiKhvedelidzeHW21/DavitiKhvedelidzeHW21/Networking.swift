//
//  Networking.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

struct NetworkService {
    
    static var shared = NetworkService()
    
    func getCountries(completionHandler: @escaping ([Country]) -> (Void)) {
        
        let urlString = "https://restcountries.com/v2/all#"
        
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error accessing restcountries.com: \(String(describing: error!.localizedDescription))")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("Error while loading the data - \(String(describing: error!.localizedDescription))")
                return
            }

        
            if let countriesSummary = try? JSONDecoder().decode([Country].self, from: data) {
                DispatchQueue.main.async {
                    completionHandler(countriesSummary)
                }
            }
            
        }
        
        task.resume()
    }
}
