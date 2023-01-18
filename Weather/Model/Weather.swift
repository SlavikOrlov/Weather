//
//  Weather.swift
//  Weather
//
//  Created by Slava Orlov on 15.01.2023.
//

import Foundation

struct Weather {

    var name: String = "Name"
    var temperature: Double = 0.0
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    var conditionCodeImage: String = ""
    var url: String = ""
    var condition: String = ""
    var windSpeed: Double = 0.0
    var pressureMm: Int = 0
    var tempMin: Int = 0
    var tempMax: Int = 0

    var conditionString: String {
        switch condition {
        case "clear":
            return "Clear"
        case "partly-cloudy":
            return "Partly cloudy"
        case "cloudy":
            return "Cloudy"
        case "overcast":
            return "Overcast"
        case "drizzle":
            return "Drizzle"
        case "light-rain":
            return "Light rain"
        case "rain":
            return "Rain"
        case "moderate-rain":
            return "Moderate rain"
        case "heavy-rain":
            return "Heavy rain"
        case "continuous-heavy-rain":
            return "Continuous heavy rain"
        case "showers":
            return "Showers"
        case "wet-snow":
            return "Wet snow"
        case "light-snow":
            return "Light snow"
        case "snow":
            return "Snow"
        case "snow-showers":
            return "Snow showers"
        case "hail":
            return "Hail"
        case "thunderstorm":
            return "Thunderstorm"
        case "thunderstorm-with-rain":
            return "Thunderstorm with rain"
        case "thunderstorm-with-hail":
            return "Thunderstorm with hail"
        default:
            return "Loading..."
        }
    }

    init?(data: WeatherData) {
        temperature = data.fact.temp
        conditionCodeImage = data.fact.icon
        url = data.info.url
        condition = data.fact.condition
        windSpeed = data.fact.windSpeed
        pressureMm = data.fact.pressureMm
        tempMin = data.forecasts.first!.parts.day.tempMin!
        tempMax = data.forecasts.first!.parts.day.tempMax!
    }

    init() {
    }

}
