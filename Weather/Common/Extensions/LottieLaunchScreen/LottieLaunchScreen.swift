//
//  Lotti.swift
//  Weather
//
//  Created by Slava Orlov on 11.01.2023.
//

import Lottie
import UIKit

final class LottieLaunchScreen {

    func configureLottieAnimation(on view: UIView) {
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
