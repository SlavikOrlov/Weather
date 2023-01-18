//
//  GetCitiesWeather.swift
//  Weather
//
//  Created by Slava Orlov on 15.01.2023.
//

import Foundation
import CoreLocation

enum CityWeather {

    static func getCityWeather(citiesArray: [String],
                               completionHandler: @escaping (Int, Weather) -> Void) {
        for (index, item) in citiesArray.enumerated() {
            getCoordinateFrom(city: item) { coordinate, error in
                guard let coordinate = coordinate else {
                    return
                }
                UserService().fetchWeather(latitude: coordinate.latitude,
                                           longitude: coordinate.longitude) { (weather) in
                    completionHandler(index, weather)
                }
            }
        }
    }

    static func getCoordinateFrom(city: String,
                                  completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(city) { (placemark, error) in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
    
}
