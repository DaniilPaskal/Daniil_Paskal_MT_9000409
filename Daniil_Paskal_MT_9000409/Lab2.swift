//
//  Lab2.swift
//  Daniil_Paskal_MT_9000409
//
//  Created by user237236 on 3/2/24.
//

import UIKit

class Lab2: UIViewController {
    // Number on screen
    var screenNumber:Int = 0
    // Amount by which number is incremented/decremented
    var step:Int = 1

    // Label displaying number
    @IBOutlet weak var numberText: UILabel!
    
    // Increment button
    @IBAction func buttonInc(_ sender: Any) {
        // Increase number by step, update label
        screenNumber += step
        numberText.text = String(screenNumber)
    }
    
    // Decrement button
    @IBAction func buttonDec(_ sender: Any) {
        // Decrease number by step, update label
        screenNumber -= step
        numberText.text = String(screenNumber)
    }
    
    // Reset button
    @IBAction func buttonReset(_ sender: Any) {
        // Set number to 0, step to 1, update label
        screenNumber = 0
        step = 1
        numberText.text = String(screenNumber)
    }
    
    // Step button
    @IBAction func buttonStep(_ sender: Any) {
        // Set step to 2
        step = 2
        print(screenNumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set screen number variable to contents of number label
        screenNumber = Int(numberText.text!) ?? 0
    }

}
