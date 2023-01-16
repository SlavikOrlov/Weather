//
//  MainTableViewCell.swift
//  Weather
//
//  Created by Slava Orlov on 16.01.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var nameCityLabel: UILabel!
    @IBOutlet private weak var statusCityLabel: UILabel!
    @IBOutlet private weak var tempCityLabel: UILabel!

    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.statusCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString
    }
}
