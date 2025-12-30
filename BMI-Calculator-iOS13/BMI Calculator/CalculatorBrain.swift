//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dhruv Nakum on 12/30/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmiValue = "0.0"
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / (height * height)
        bmiValue = String(format: "%.1f", bmi)
    }
    
    func getBMIValue() -> String {
        return bmiValue
    }
}
