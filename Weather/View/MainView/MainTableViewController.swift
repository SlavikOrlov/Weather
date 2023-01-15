//
//  MainTableViewController.swift
//  Weather
//
//  Created by Slava Orlov on 14.01.2023.
//

import UIKit
import CoreLocation

final class MainTableViewController: UITableViewController {

    // MARK: - Properties

    let emptyCity = Weather()
    let userServise = UserService()
    var citiesArray = [Weather]()
    let nameCities = [
        "Barselona",
        "Antalya",
        "Buenos Aires",
        "Helsinki",
        "Ottawa",
        "Berlin",
        "Milan",
        "Tokyo",
        "Moscow",
        "London"
    ]

    // MARK: - UITableViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()

        checkCitiesArray()
        addCities()
    }
    
    func checkCitiesArray() {
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCities.count)
        }
    }
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCities) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCities[index]
            print(self.citiesArray)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        var weather = Weather()
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)
        return cell
    }

}

// MARK: - Private Methods

private extension MainTableViewController {

    func configureAppearance() {
        configureLottieAnimation()
    }

    func configureLottieAnimation() {
        let controller = navigationController ?? self
        LottieLaunchScreen().configureLottieAnimation(on: controller.view)
    }

}
