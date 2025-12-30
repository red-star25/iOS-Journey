//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dhruv Nakum on 12/30/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
        
    }
    
    func getBMIValue() -> String {
        return String(format:"%.2f",bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor? {
        return bmi?.color ?? .white
    }
}
