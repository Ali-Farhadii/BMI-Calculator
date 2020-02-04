//
//  ViewController.swift
//  BMI Calculator
//
//  Created by ali farhadi on 8/21/1398 AP.
//  Copyright © 1398 Ali Farhadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    enum Gender {
        case male
        case feMale
    }
    
    // Property
    var userGender: Gender?
    var heightSliderValue = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userGender = .male
        updateUI()
    }
    
    // Outlets
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var maleLbl: UIButton!
    @IBOutlet weak var feMaleLbl: UIButton!
    
    // Actions
    @IBAction func heightSlider(_ sender: UISlider) {
        
        let sliderValue = Int(sender.value)
        heightSliderValue = sliderValue
        heightLbl.text = "\(sliderValue)"
    }
    
    @IBAction func weightBtns(_ sender: UIButton) {
        
        // To have an int value for increase or decrease it
        let currentValue = Int(weightLbl.text!)
        
        if sender.title(for: .normal) == "+" {
            // Set a maximum value
            guard currentValue! < 130 else {return}
            weightLbl.text = "\(currentValue!+1)"
        }
        
        if sender.title(for: .normal) == "-" {
            // Set a minimum value
            guard currentValue! > 45 else {return}
            weightLbl.text = "\(currentValue!-1)"
        }
    }
    
    @IBAction func ageBtns(_ sender: UIButton) {
        
        // To have an int value for increase or decrease it
        let currentValue = Int(ageLbl?.text ?? "")
        
        if sender.title(for: .normal) == "+" {
            
            guard currentValue! < 85 else {return}
            ageLbl.text = "\(currentValue!+1)"
        }
        
        if sender.title(for: .normal) == "-" {
            
            guard currentValue! > 10 else {return}
            ageLbl.text = "\(currentValue!-1)"
        }
    }
    
    @IBAction func maleBtn(_ sender: UIButton) {
        // In order to indicate that this button is selected or not
        guard userGender == Gender.feMale else {return}
        
        userGender = .male
        sender.alpha = 1
        feMaleLbl.alpha = 0.2
    }
    
    @IBAction func femaleBtn(_ sender: UIButton) {
        // In order to indicate that this button is selected or not
        guard userGender == Gender.male else {return}
        
        userGender = .feMale
        sender.alpha = 1
        maleLbl.alpha = 0.2
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "resultSegue" else {return}
        
        let resultScreen = segue.destination as! ResultScreen
        
        resultScreen.weight = Int(weightLbl.text!)!
        resultScreen.height = Double(heightSliderValue)
    }
    
    func updateUI() {
        
        if view.viewWithTag(1) != nil {
            maleLbl.layer.cornerRadius = 75
        }
        
        if view.viewWithTag(2) != nil {
            feMaleLbl.alpha = 0.2
            feMaleLbl.layer.cornerRadius = 75
        }
    }
}

