//
//  Quadratic.swift
//  Daniil_Paskal_MT_9000409
//
//  Created by user237236 on 3/3/24.
//

import UIKit

class Quadratic: UIViewController {
    // Dictionary of message strings
    let messages: [String: String] = ["a": "Enter a value for A, B, and C to find X.",
        "b": "The value you entered for A is invalid.",
        "c": "The value you entered for B is invalid.",
        "d": "The value you entered for C is invalid.",
        "e": "There are no results since the discriminant is less than zero.",
        "f": "There is only one value for X.",
        "g": "There are two values for X."]
    
    // Field for "a" variable
    @IBOutlet weak var fieldA: UITextField!
    
    // Field for "b" variable
    @IBOutlet weak var fieldB: UITextField!
    
    // Field of "c" variable
    @IBOutlet weak var fieldC: UITextField!
    
    // Message label
    @IBOutlet weak var labelMessage: UILabel!
    
    // Calculated value label
    @IBOutlet weak var labelValue: UILabel!
    
    // Calculate button
    @IBAction func buttonCalc(_ sender: Any) {
        // Reset value label
        labelValue.text = ""
        
        // Cast text field values to float
        let a = Float(fieldA.text ?? "")
        let b = Float(fieldB.text ?? "")
        let c = Float(fieldC.text ?? "")
        
        // If value fails to parse, display message
        if (a == nil || a == 0) {
            labelMessage.text = messages["b"]
            return
        } else if (b == nil) {
            labelMessage.text = messages["c"]
            return
        } else if (c == nil) {
            labelMessage.text = messages["d"]
            return
        }
        
        // Calculate results of quadratic formula
        let (x1, x2) = quadraticFormula(a: a!, b: b!, c: c!)
        
        // Check if any formula results in invalid or identical values
        if (x1.isNaN || x2.isNaN || x1 == x2) {
            // If one of values is invalid, display message
            labelMessage.text = messages["f"]
            
            // Check if both values invalid
            if (x1.isNaN && x2.isNaN) {
                // If both invalid, display message
                labelMessage.text = messages["e"]
            } else {
                // If one is valid, display valid value
                labelValue.text = "x = \(x1.isNaN ? x2 : x1)"
            }
        } else {
            // If both values valid, display message and values
            labelMessage.text = messages["g"]
            labelValue.text = "x1 = \(x1), x2 = \(x2)"
        }
    }
    
    // Clear fields button
    @IBAction func buttonClear(_ sender: Any) {
        // Clear text fields
        fieldA.text = ""
        fieldB.text = ""
        fieldC.text = ""
        
        // Set labels
        labelMessage.text = messages["a"]
        labelValue.text = ""
    }
    
    // Calculate quadratic formula
    func quadraticFormula(a:Float, b:Float, c:Float) -> (Float, Float) {
        let discriminant = pow(b, 2) - (4 * a * c)
        let x1 = (-b - sqrt(discriminant))/(2 * a)
        let x2 = (-b + sqrt(discriminant))/(2 * a)
        print(x1, x2)
        return (x1, x2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set label text to empty at start
        labelMessage.text = ""
        labelValue.text = ""
        
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
