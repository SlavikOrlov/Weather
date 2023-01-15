//
//  UserService.swift
//  Weather
//
//  Created by Slava Orlov on 15.01.2023.
//

import Foundation

struct UserService {

    private enum Constants {
        static let key: String = "9a482372-628c-450e-8362-b72093324986"
        static let forHTTPHeaderField: String = "X-Yandex-API-Key"
        static let httpMethodGet: String = "GET"
    }

    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weather) -> Void) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
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
            //print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completionHandler(weather)
                //print(weather)
            }
        }
        task.resume()
    }

    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(data: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

}
