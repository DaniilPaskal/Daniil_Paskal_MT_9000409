//
//  Canada.swift
//  Daniil_Paskal_MT_9000409
//
//  Created by user237236 on 3/3/24.
//

import UIKit

class Canada: UIViewController {
    // Array of city names
    let cities: [String] = ["Calgary", "Halifax", "Montreal", "Toronto", "Vancouver", "Winnipeg"]

    // City image
    @IBOutlet weak var canadaImage: UIImageView!
    
    // City name field
    @IBOutlet weak var cityField: UITextField!
    
    // Error message for city not found
    @IBOutlet weak var errorMessage: UILabel!
    
    // Button to find city
    @IBAction func findButton(_ sender: Any) {
        // Get city name from field and capitalize
        let city = cityField.text?.capitalized
        
        // Check if city name in cities array
        if (cities.contains(city!)) {
            // Set image to city image and hide error message
            canadaImage.image = UIImage(named: city!)
            errorMessage.isHidden = true
        } else {
            // Set image to default and show error message
            canadaImage.image = UIImage(named: "Canada")
            errorMessage.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide error message
        errorMessage.isHidden = true

        // Look for single or multiple taps
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    // Call when tap recognized
    @objc func dismissKeyboard() {
        // Dismiss keyboard
        view.endEditing(true)
    }

}
