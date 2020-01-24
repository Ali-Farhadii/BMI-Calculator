//
//  CustomButton.swift
//  BMI Calculator
//
//  Created by ali farhadi on 11/3/1398 AP.
//  Copyright © 1398 Ali Farhadi. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCalculateButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCalculateButton()
    }
    
    func setUpCalculateButton() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2
    }
}
