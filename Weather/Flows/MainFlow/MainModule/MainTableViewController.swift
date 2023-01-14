//
//  MainTableViewController.swift
//  Weather
//
//  Created by Slava Orlov on 14.01.2023.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        fetchWeather()
    }

    func fetchWeather() {

        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=59.57&lon=30.19"
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("9a482372-628c-450e-8362-b72093324986", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

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
