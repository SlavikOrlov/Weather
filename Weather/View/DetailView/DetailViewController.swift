//
//  DetailViewController.swift
//  Weather
//
//  Created by Slava Orlov on 16.01.2023.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let temperatureSign = "°C"
        static let pressureLabel = NSLocalizedString("detail.pressure", comment: "")
        static let pressureConstantLabel = NSLocalizedString("detail.pressure.description", comment: "")
        static let windSpeedLabel = NSLocalizedString("detail.windSpeed", comment: "")
        static let windConstantLabel = NSLocalizedString("detail.windSpeed.description", comment: "")
        static let minTempLabel = NSLocalizedString("detail.minTemp", comment: "")
        static let maxTempLabel = NSLocalizedString("detail.maxTemp", comment: "")
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var nameCityLabel: UILabel!
    @IBOutlet private weak var imageWeatherView: UIView!
    @IBOutlet private weak var conditionCityLabel: UILabel!

    @IBOutlet private weak var tempCityLabel: UILabel!
    @IBOutlet private weak var tempConstantLabel: UILabel!

    @IBOutlet private weak var pressureNameLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var pressureConstantLabel: UILabel!

    @IBOutlet private weak var windSpeedNameLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var windConstantLabel: UILabel!

    @IBOutlet private weak var minTempNameLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var minTempConstantLabel: UILabel!

    @IBOutlet private weak var maxTempNameLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var maxTempConstantLabel: UILabel!
    
    // MARK: - Properties

    var weatherModel: Weather?

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configure(with: weatherModel)
    }

}

// MARK: - Private Methods

private extension DetailViewController {

    func configure(with model: Weather?) {
        nameCityLabel.text = model?.name
        nameCityLabel.text = model?.name
        conditionCityLabel.text = model?.conditionString
        tempCityLabel.text = model?.temperatureString
        pressureLabel.text = "\((model?.pressureMm)!)"
        windSpeedLabel.text = "\((model?.windSpeed)!)"
        minTempLabel.text = "\((model?.tempMin)!)"
        maxTempLabel.text = "\((model?.tempMax)!)"
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(model!.conditionCodeImage).svg")
        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.imageWeatherView.bounds)
        }
        self.imageWeatherView.addSubview(weatherImage)
    }

    func configureAppearance() {
        configureNavigationBar()
        configureNameCityLabel()
        configureConditionCityLabel()
        configureTempLabels()
        configureLeftStackLabels()
    }

    func configureNavigationBar() {
        navigationItem.title = NSLocalizedString("detail.title", comment: "")
    }

    func configureNameCityLabel() {
        nameCityLabel.textColor = AssetColor.black
        nameCityLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        nameCityLabel.textAlignment = .center
    }

    func configureConditionCityLabel() {
        conditionCityLabel.textColor = AssetColor.black
        conditionCityLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        conditionCityLabel.textAlignment = .center
    }

    func configureTempLabels() {
        tempCityLabel.textColor = AssetColor.black
        tempCityLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tempCityLabel.textAlignment = .center
        tempConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tempConstantLabel.textAlignment = .center
        tempConstantLabel.text = Constants.temperatureSign
    }

    func configureLeftStackLabels() {
        // Pressure labels
        pressureNameLabel.text = Constants.pressureLabel
        pressureNameLabel.textColor = AssetColor.black
        pressureNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        pressureNameLabel.textAlignment = .left
        
        pressureLabel.textColor = AssetColor.black
        pressureLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        pressureLabel.textAlignment = .left
        
        pressureConstantLabel.text = Constants.pressureConstantLabel
        pressureConstantLabel.textColor = AssetColor.black
        pressureConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        pressureConstantLabel.textAlignment = .right
        
        // Wind speed labels
        windSpeedNameLabel.text = Constants.windSpeedLabel
        windSpeedNameLabel.textColor = AssetColor.black
        windSpeedNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        windSpeedNameLabel.textAlignment = .left
        
        windSpeedLabel.textColor = AssetColor.black
        windSpeedLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        windSpeedLabel.textAlignment = .left
        
        windConstantLabel.text = Constants.windConstantLabel
        windConstantLabel.textColor = AssetColor.black
        windConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        windConstantLabel.textAlignment = .right

        // Min temperature labels
        minTempNameLabel.text = Constants.minTempLabel
        minTempNameLabel.textColor = AssetColor.black
        minTempNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        minTempNameLabel.textAlignment = .left
        
        minTempLabel.textColor = AssetColor.black
        minTempLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        minTempLabel.textAlignment = .left
        
        minTempConstantLabel.text = Constants.temperatureSign
        minTempConstantLabel.textColor = AssetColor.black
        minTempConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        minTempConstantLabel.textAlignment = .right

        // Max temperature labels
        maxTempNameLabel.text = Constants.maxTempLabel
        maxTempNameLabel.textColor = AssetColor.black
        maxTempNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        maxTempNameLabel.textAlignment = .left
        
        maxTempLabel.textColor = AssetColor.black
        maxTempLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        maxTempLabel.textAlignment = .left
        
        maxTempConstantLabel.text = Constants.temperatureSign
        maxTempConstantLabel.textColor = AssetColor.black
        maxTempConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        maxTempConstantLabel.textAlignment = .right
    }

}
