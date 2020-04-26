//
//  ViewController.swift
//  BMI Calculator
//
//  Created by ali farhadi on 8/21/1398 AP.
//  Copyright © 1398 Ali Farhadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Gender {
        case male
        case feMale
    }
    
    //MARK: - Property
    var userGender: Gender?
    var heightSliderValue = 160
    var weightNumbers = [Int]()
    var ageNumbers = [Int]()
    var userWeight: Int?
    var userAge: Int?
    
    //MARK: - Outlets
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var maleLbl: UIButton!
    @IBOutlet weak var feMaleLbl: UIButton!
    @IBOutlet weak var weightPickerView: UIPickerView!
    @IBOutlet weak var agePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userGender = .male
        configureGenderButtons()
        arrayIniti()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Actions
    @IBAction func heightSlider(_ sender: UISlider) {
        
        let sliderValue = Int(sender.value)
        heightSliderValue = sliderValue
        heightLbl.text = "\(sliderValue)"
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
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {}
    
    //MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "resultSegue" else {return}
        
        let resultScreen = segue.destination as! ResultScreen
        
        resultScreen.weight = userWeight ?? 55
        resultScreen.height = Double(heightSliderValue)
    }
    
    func configureGenderButtons() {
        
        if view.viewWithTag(1) != nil {
            maleLbl.layer.cornerRadius = 75
        }
        
        if view.viewWithTag(2) != nil {
            feMaleLbl.alpha = 0.2
            feMaleLbl.layer.cornerRadius = 75
        }
    }
    
    // Fill arrays that are going to show in pickerViews
    func arrayIniti() {
        
        for index in 55...110 {
            weightNumbers.append(index)
        }
        
        for index in 18...85 {
            ageNumbers.append(index)
        }
    }
}

//MARK: - Extension for customizing pickerViews
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0:
            return weightNumbers.count
            
        case 1:
            return ageNumbers.count
            
        default:
            return 0
        }
    }
   
    // Use this method for customization pickerView with custom font,size and color
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        }
        else {
            label = UILabel()
        }
        
        label.font = UIFont(name: "Avenir Next Medium", size: 25)
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        switch pickerView.tag {
        case 0:
            label.text = String(weightNumbers[row])
        
        case 1:
            label.text = String(ageNumbers[row])
    
        default:
            return label
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 0:
            userWeight = weightNumbers[row]
        
        case 1:
            userAge = ageNumbers[row]
            
        default:
            return
        }
    }
}
