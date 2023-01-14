//
//  Constants.swift
//  Weather
//
//  Created by Slava Orlov on 15.01.2023.
//

import Foundation

enum Constants {
    static let url: String = "https://api.weather.yandex.ru/v2/forecast?lat=59.57&lon=30.19"
    static let key: String = "9a482372-628c-450e-8362-b72093324986"
    static let forHTTPHeaderField: String = "X-Yandex-API-Key"
    static let httpMethodGet: String = "GET"
}
