//
//  UserService.swift
//  Weather
//
//  Created by Slava Orlov on 15.01.2023.
//

import Foundation

struct UserService {

    func fetchWeather() {
        let urlString = Constants.url
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue(Constants.key, forHTTPHeaderField: Constants.forHTTPHeaderField)
        request.httpMethod = Constants.httpMethodGet
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }

}
