//
//  NetworkManager.swift
//  HackerNewsApp
//
//  Created by Dhruv Nakum on 2/11/26.
//

import Foundation
import Observation


@Observable
class NetworkManager{
    
    var posts = [Post]()
    
    func fetchData(){
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
