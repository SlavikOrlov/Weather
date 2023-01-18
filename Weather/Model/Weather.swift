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
            return NSLocalizedString("weather.condition.clear", comment: "")
        case "partly-cloudy":
            return NSLocalizedString("weather.condition.partlyCloudy", comment: "")
        case "cloudy":
            return NSLocalizedString("weather.condition.cloudy", comment: "")
        case "overcast":
            return NSLocalizedString("weather.condition.overcast", comment: "")
        case "drizzle":
            return NSLocalizedString("weather.condition.drizzle", comment: "")
        case "light-rain":
            return NSLocalizedString("weather.condition.lightRain", comment: "")
        case "rain":
            return NSLocalizedString("weather.condition.rain", comment: "")
        case "moderate-rain":
            return NSLocalizedString("weather.condition.moderateRain", comment: "")
        case "heavy-rain":
            return NSLocalizedString("weather.condition.heavyRain", comment: "")
        case "continuous-heavy-rain":
            return NSLocalizedString("weather.condition.continuousHeavyRain", comment: "")
        case "showers":
            return NSLocalizedString("weather.condition.showers", comment: "")
        case "wet-snow":
            return NSLocalizedString("weather.condition.wetSnow", comment: "")
        case "light-snow":
            return NSLocalizedString("weather.condition.lightSnow", comment: "")
        case "snow":
            return NSLocalizedString("weather.condition.snow", comment: "")
        case "snow-showers":
            return NSLocalizedString("weather.condition.snowShowers", comment: "")
        case "hail":
            return NSLocalizedString("weather.condition.hail", comment: "")
        case "thunderstorm":
            return NSLocalizedString("weather.condition.thunderstorm", comment: "")
        case "thunderstorm-with-rain":
            return NSLocalizedString("weather.condition.thunderstormWithRain", comment: "")
        case "thunderstorm-with-hail":
            return NSLocalizedString("weather.condition.thunderstormWithHail", comment: "")
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
