//
//  alertAddCity.swift
//  Weather
//
//  Created by Slava Orlov on 18.01.2023.
//

import UIKit

extension UIViewController {

    func alertAddCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            let textField = alertController.textFields?.first
            guard let text = textField?.text else {
                return
            }
            completionHandler(text)
        }
        alertController.addTextField { (text) in
            text.placeholder = placeholder
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }

}
