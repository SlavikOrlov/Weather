//
//  MainTableViewController.swift
//  Weather
//
//  Created by Slava Orlov on 14.01.2023.
//

import UIKit

class MainTableViewController: UITableViewController {

    // MARK: - Properties

    let userServise = UserService()

    // MARK: - UITableViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        userServise.fetchWeather()
    }

    // MARK: - UITableViewDataSource

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
