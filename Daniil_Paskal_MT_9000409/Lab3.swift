//
//  Lab3.swift
//  Daniil_Paskal_MT_9000409
//
//  Created by user237236 on 3/2/24.
//

import UIKit

class Lab3: UIViewController {
    // Success message
    let successString:String = "Successfully submitted!"
    // Failure message
    let incompleteString:String = "Complete the missing info!"
    // Summary of user info
    var summary:String = ""

    // First name field
    @IBOutlet weak var textFieldFirstName: UITextField!
    
    // Last name field
    @IBOutlet weak var textFieldLastName: UITextField!
    
    // Country field
    @IBOutlet weak var textFieldCountry: UITextField!
    
    // Age field
    @IBOutlet weak var textFieldAge: UITextField!
    
    // Summary view
    @IBOutlet weak var textViewSummary: UITextView!
    
    // Success/failure message label
    @IBOutlet weak var labelSuccess: UILabel!
    
    // Button to create summary
    @IBAction func buttonAdd(_ sender: Any) {
        summary = """
        Full name: \(textFieldFirstName.text!) \(textFieldLastName.text!)
        Country: \(textFieldCountry.text!)
        Age: \(textFieldAge.text!)
        """
        textViewSummary.text = summary
    }
    
    // Button to submit info
    @IBAction func buttonSubmit(_ sender: Any) {
        // Validate data; display success/failure message based on validity
        labelSuccess.isHidden = false
        if (textFieldFirstName.hasText && textFieldLastName.hasText && textFieldCountry.hasText && textFieldAge.hasText) {
            labelSuccess.text = successString
        } else {
            labelSuccess.text = incompleteString
        }
    }
    
    // Clear fields button
    @IBAction func buttonClear(_ sender: Any) {
        textFieldFirstName.text = ""
        textFieldLastName.text = ""
        textFieldCountry.text = ""
        textFieldAge.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide success/failure message
        labelSuccess.isHidden = true
    }

}
