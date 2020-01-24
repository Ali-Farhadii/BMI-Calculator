//
//  ResultScreen.swift
//  BMI Calculator
//
//  Created by ali farhadi on 11/3/1398 AP.
//  Copyright © 1398 Ali Farhadi. All rights reserved.
//

import UIKit

enum weightCondition {
    case underWeight
    case normal
    case overWeight
    case obesity
    case morbidObesity
    case superMorbidObesity
}

class ResultScreen: ViewController {

    // Property
    var height = 0.0
    var weight = 0
    var bmiMode: weightCondition?
    var result = 0.0
    
    var ranges = ["underWeight" : "less than 18.5", "normal" : "18.5 - 24.9", "overWeight" : "25 - 29.9", "obesity" : "30 - 39.9", "morbidObesity" : "40 - 49.9", "superMorbidObesity" : "50 or greater"]
    
    var messages = ["underWeight" : "Comeon! eat more pizza :)", "normal" : "You have a normal body weight. Good job!", "overWeight" : "Look out! You'r going to pass", "obesity" : "Let's start to be fit", "morbidObesity" : "Hey dude! take it serious", "superMorbidObesity" : "Oh My God! you're in dangerous. Please do something"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateBMI()
    }

    // Outlets
    @IBOutlet weak var resultModeLbl: UILabel!
    @IBOutlet weak var resultValueLbl: UILabel!
    @IBOutlet weak var rangeModeLbl: UILabel!
    @IBOutlet weak var rangeValueLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func calculateBMI() {
        
        let dividedHeight = Double(height / 100)
        
        result = (Double(weight) / (dividedHeight * dividedHeight))
        
        switch result {
        
        case 0..<18:
            bmiMode = .underWeight
            updateUI(bmiMode: bmiMode!)
            break

        case 18..<25:
            bmiMode = .normal
            updateUI(bmiMode: bmiMode!)
            break
            
        case 25..<30:
            bmiMode = .overWeight
            updateUI(bmiMode: bmiMode!)
            break
            
        case 30..<40:
            bmiMode = .obesity
            updateUI(bmiMode: bmiMode!)
            break
            
        case 40..<50:
            bmiMode = .morbidObesity
            updateUI(bmiMode: bmiMode!)
            break
            
        case 50..<100:
            bmiMode = .superMorbidObesity
            updateUI(bmiMode: bmiMode!)
            break
        
        default:
            break
        }
    }
    
    func updateUI(bmiMode:weightCondition) {
     
        switch bmiMode {
        
        case .underWeight:
            resultModeLbl.text = "Under Weight"
            resultModeLbl.textColor = .systemYellow
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Under Weight BMI range:"
            rangeValueLbl.text = ranges["underWeight"]
            messageLbl.text = messages["underWeight"]
            
        case .normal:
            resultModeLbl.text = "Normal"
            resultModeLbl.textColor = .systemGreen
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Normal BMI range:"
            rangeValueLbl.text = ranges["normal"]
            messageLbl.text = messages["normal"]
        
        case .overWeight:
            resultModeLbl.text = "Over Weight"
            resultModeLbl.textColor = .systemOrange
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Over Weight BMI range:"
            rangeValueLbl.text = ranges["overWeight"]
            messageLbl.text = messages["overWeight"]
            
        case .obesity:
            resultModeLbl.text = "Obesity"
            resultModeLbl.textColor = UIColor(red: 1, green: 0.41, blue: 0.22, alpha: CGFloat(1))
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Obesity BMI range:"
            rangeValueLbl.text = ranges["obesity"]
            messageLbl.text = messages["obesity"]

        case .morbidObesity:
            resultModeLbl.text = "Morbid Obesity"
            resultModeLbl.textColor = UIColor(red: 1, green: 0.30, blue: 0.06, alpha: CGFloat(1))
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Morbid Obesity BMI range:"
            rangeValueLbl.text = ranges["morbidObesity"]
            messageLbl.text = messages["morbidObesity"]

        case .superMorbidObesity:
            resultModeLbl.text = "Super Morbid Obesity"
            resultModeLbl.textColor = .systemRed
            resultValueLbl.text = String(format: "%.1f", result)
            rangeModeLbl.text = "Super Morbid Obesity BMI range:"
            rangeModeLbl.font = UIFont(name: rangeModeLbl.font.fontName, size: 20)
            rangeValueLbl.text = ranges["superMorbidObesity"]
            messageLbl.text = messages["superMorbidObesity"]
            
        } // End of switch statement
        
    } // End of updateUI function

} // End of class
