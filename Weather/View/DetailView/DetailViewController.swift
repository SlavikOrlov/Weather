//
//  DetailViewController.swift
//  Weather
//
//  Created by Slava Orlov on 16.01.2023.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {

    // MARK: Constants

    // MARK: - IBOutlets
    @IBOutlet private weak var nameCityLabel: UILabel!
    @IBOutlet private weak var imageWeatherView: UIView!
    @IBOutlet private weak var conditionCityLabel: UILabel!
    @IBOutlet private weak var tempCityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!

    // MARK: - Properties

    var weatherModel: Weather?

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

}

// MARK: - Private Methods

private extension DetailViewController {

    func configureAppearance() {
        refreshLabels()
    }

    func refreshLabels() {
        nameCityLabel.text = weatherModel?.name
        conditionCityLabel.text = weatherModel?.conditionString
        tempCityLabel.text = weatherModel?.temperatureString
        pressureLabel.text = "\((weatherModel?.pressureMm)!)"
        windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        minTempLabel.text = "\((weatherModel?.tempMin)!)"
        maxTempLabel.text = "\((weatherModel?.tempMax)!)"
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCodeImage).svg")
        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.imageWeatherView.bounds)
        }
        self.imageWeatherView.addSubview(weatherImage)
    }

}
