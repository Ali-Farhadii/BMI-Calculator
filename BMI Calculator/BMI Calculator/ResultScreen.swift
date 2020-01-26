//
//  ResultScreen.swift
//  BMI Calculator
//
//  Created by ali farhadi on 11/3/1398 AP.
//  Copyright © 1398 Ali Farhadi. All rights reserved.
//

import UIKit

class ResultScreen: ViewController {

    // Property
    var height = 0.0
    var weight = 0
    var result = 0.0
    
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
            updateUI(bmiMode: "Under Weight", color: .systemYellow, result: result, rangeLbl: "Under Weight BMI range:", rangeVlu:"less than 18.5", message: "Comeon! eat more pizza :)")
            break

        case 18..<25:
            updateUI(bmiMode: "Normal Weight", color: .systemGreen, result: result, rangeLbl: "Normal Weight BMI range:", rangeVlu:"18.5 - 24.9", message: "You have a normal body weight. Good job!")
            break
            
        case 25..<30:
            updateUI(bmiMode: "Over Weight", color: .systemOrange , result: result, rangeLbl: "Over Weight BMI range:", rangeVlu:"25 - 29.9", message: "Look out! You'r going to pass")
            break
            
        case 30..<40:
            updateUI(bmiMode: "Obesity", color: UIColor(red: 1, green: 0.41, blue: 0.22, alpha: CGFloat(1)), result: result, rangeLbl: "Ovesity BMI range:", rangeVlu:"30 - 39.9", message: "Let's start to be fit")
            break
            
        case 40..<50:
            updateUI(bmiMode: "Morbid Obesity", color: UIColor(red: 1, green: 0.30, blue: 0.06, alpha: CGFloat(1)), result: result, rangeLbl: "Morbid Obesity BMI range:", rangeVlu:"40 - 49.9", message: "Hey dude! take it serious")
            break
            
        case 50..<100:
            updateUI(bmiMode: "Super Morbid Obesity", color: .systemRed, result: result, rangeLbl: "Super Morbid Obesity BMI range:", rangeVlu:"50 or greater", message: "Oh My God! you're in dangerous. Please do something")
            break
        
        default:
            break
        }
    }
    
    func updateUI(bmiMode:String,color:UIColor,result:Double,rangeLbl:String,rangeVlu:String,message:String) {
     
        if bmiMode == "Super Morbid Obesity" {
            rangeModeLbl.font = UIFont(name: rangeModeLbl.font.fontName, size: 18)
        }
        resultModeLbl.text = "\(bmiMode)"
        resultModeLbl.textColor = color
        resultValueLbl.text = String(format: "%.1f", result)
        rangeModeLbl.text = "\(rangeLbl)"
        rangeValueLbl.text = "\(rangeVlu)"
        messageLbl.text = "\(message)"

    } // End of updateUI function

} // End of class
