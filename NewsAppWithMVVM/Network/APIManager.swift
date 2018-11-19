//
//  APIManager.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/19/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

class APIManager {
    
    func getNews(completion: @escaping ([News]) -> Void) {
        var news = [News]()
        let session = URLSession.shared
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=2afc70ce61b5475395651e4453bb0486")
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                print("Something error with server")
            }
            
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(Response.self, from: data)
                news = json.news!
                
                DispatchQueue.main.async {
                    completion(news)
                }
            } catch let err {
                print(err.localizedDescription)
                print("Something wrong when decode data")
            }
        }
        task.resume()
    }
}
