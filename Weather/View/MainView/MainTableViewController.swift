//
//  MainTableViewController.swift
//  Weather
//
//  Created by Slava Orlov on 14.01.2023.
//

import UIKit

final class MainTableViewController: UITableViewController {

    // MARK: - Properties

    let emptyCity = Weather()
    let userServise = UserService()

    var citiesArray = [Weather]()
    var filterCityArray = [Weather]()
    var nameCities = ["Antalya", "Buenos Aires", "Helsinki", "Ottawa", "Berlin", "Milan", "Tokyo", "Moscow", "London"]

    // MARK: - Private Properties

    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - UITableViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        checkCitiesArray()
        addCities()
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCityArray.count
        }
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        var weather = Weather()
        if isFiltering {
            weather = filterCityArray[indexPath.row]
        } else {
            weather = citiesArray[indexPath.row]
        }
        cell.configure(weather: weather)
        cell.backgroundColor = AssetColor.blue
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            if isFiltering {
                let filter = filterCityArray[indexPath.row]
                let detailVC = segue.destination as! DetailViewController
                detailVC.weatherModel = filter
            } else {
                let cityWeather = citiesArray[indexPath.row]
                let detailVC = segue.destination as! DetailViewController
                detailVC.weatherModel = cityWeather
            }
        }
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            let editingRow = self.nameCities[indexPath.row]
            if let index = self.nameCities.firstIndex(of: editingRow) {
                if self.isFiltering {
                    self.filterCityArray.remove(at: index)
                } else {
                    self.citiesArray.remove(at: index)
                }
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

// MARK: - Private Methods

private extension MainTableViewController {

    func configureAppearance() {
        configureLottieAnimation()
        configureSearchController()
        configureTableView()
    }

    func configureLottieAnimation() {
        let controller = navigationController ?? self
        LottieLaunchScreen().configureLottieAnimation(on: controller.view)
    }

    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.backgroundColor = AssetColor.blue
    }

    func configureTableView() {
        self.title = NSLocalizedString("navBar.main", comment: "")
        tableView.backgroundColor = AssetColor.blue
        tableView.alwaysBounceVertical = false
    }

    func checkCitiesArray() {
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCities.count)
        }
    }

    func addCities() {
        CityWeather.getCityWeather(citiesArray: self.nameCities) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCities[index]
            print(self.citiesArray)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - Internal Methods

extension MainTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filterCityArray = citiesArray.filter {
            $0.name.contains(searchText)
        }
        tableView.reloadData()
    }

}

// MARK: - Actions

private extension MainTableViewController {

    @IBAction func didTapAddCity(_ sender: Any) {
        alertAddCity(name: "City", placeholder: "Enter the name of the city") { (city) in
            self.nameCities.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
}
