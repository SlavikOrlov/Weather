//
//  MainViewController.swift
//  Weather
//
//  Created by Slava Orlov on 05.01.2023.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: Constants

    // MARK: - IBOutlets

    // MARK: - Properties

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

}

// MARK: - Private Methods

private extension MainViewController {

    func configureAppearance() {
        configureLottieAnimation()
        
    }

    func configureLottieAnimation() {
        let controller = navigationController ?? self
        LottieLaunchScreen().configureLottieAnimation(on: controller.view)
    }

}

// MARK: - Actions
