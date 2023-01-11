//
//  MainViewController.swift
//  Weather
//
//  Created by Slava Orlov on 05.01.2023.
//

import UIKit
import Lottie

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
        let animationView: LottieAnimationView = {
            let lottieAnimationView = LottieAnimationView(name: "lottieFileWeather")
            lottieAnimationView.backgroundColor = AssetColor.blue
            return lottieAnimationView
        }()
        view.addSubview(animationView)
        
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.alpha = 1
        animationView.play { _ in
            UIView.animate(withDuration: 0.4, animations: {
                animationView.alpha = 0
            }, completion: { _ in
                animationView.isHidden = true
                animationView.removeFromSuperview()
            })
        }
    }

}

// MARK: - Actions
