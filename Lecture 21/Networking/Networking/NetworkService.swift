//
//  NetworkService.swift
//  Networking
//
//  Created by Vasili Baramidze on 10.08.22.
//

import UIKit

class NetworkService {
    static var shared = NetworkService()
    
    private var session = URLSession()
    
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        self.session = urlSession
    }
    
    func getFolowers(comletion: @escaping ([Follower])->(Void)) {
        
        let urlsString = "https://api.github.com/users/SAllen0400/followers"
        let url = URL(string: urlsString)!

        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Wrong response")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try! decoder.decode([Follower].self, from: data)
                DispatchQueue.main.async {
                    comletion(object)
                }
            }
            
            catch {
                print("decoding error")
            }
            
        }.resume()
    }
    
    func getMemes(comletion: @escaping (MemesResponseData)->(Void)) {
        let urlsString = "https://api.imgflip.com/get_memes#"
        let url = URL(string: urlsString)!

        
        
        session.dataTask(with: url) { data, response, error in
            let data = data
            let decoder = JSONDecoder()
            let object = try! decoder.decode(MemesResponseData.self, from: data!)
            DispatchQueue.main.async {
                comletion(object)
            }
        }.resume()
    }
    
    func getData<T: Codable>(urlString: String, completion: @escaping (T) -> (Void)) {
        
        let url = URL(string: urlString)!
        
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Wrong response")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try! decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(object)
                }
            }
            
            catch {
                print("decoding error")
            }
            
        }.resume()
    }
}
