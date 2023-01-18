//
//  MainTableViewCell.swift
//  Weather
//
//  Created by Slava Orlov on 16.01.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let temperatureSign = "°C"
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var nameCityLabel: UILabel!
    @IBOutlet private weak var statusCityLabel: UILabel!
    @IBOutlet private weak var tempCityLabel: UILabel!
    @IBOutlet private weak var tempConstantLabel: UILabel!
    
    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal Methods
    
    func setupInitialState() {
        configureNameCityLabel()
        configureStatusCityLabel()
        configureTempCityLabel()
        configureTempConstantLabel()
    }

    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.statusCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString
    }

}

// MARK: - Private Methods

private extension MainTableViewCell {

    func configureNameCityLabel() {
        nameCityLabel.textColor = AssetColor.black
        nameCityLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameCityLabel.textAlignment = .left
    }

    func configureStatusCityLabel() {
        statusCityLabel.textColor = AssetColor.gray
        statusCityLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        statusCityLabel.textAlignment = .right
    }

    func configureTempCityLabel() {
        tempCityLabel.textColor = AssetColor.black
        tempCityLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tempCityLabel.textAlignment = .right
    }

    func configureTempConstantLabel() {
        tempConstantLabel.text = Constants.temperatureSign
        tempConstantLabel.textColor = AssetColor.black
        tempConstantLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        tempConstantLabel.textAlignment = .right
    }

}
