//
//  BMILogic.swift
//  CPSC5330-extra
//
//  Created by user260677 on 7/9/24.
//

import Foundation

struct BMILogic {
    
    var heightText = ""
    var weightText = ""
    
    var mainPageText = ""
    
    var validity = false
    
    var heightValue = 0
    var weightValue = 0
    var result = 0
    var resultText = ""
    
    mutating func validateInput(_ height: String, _ weight: String) {
        if Int(height) ?? 0 > 0 {
            if Int(weight) ?? 0 > 0 {
                validity = true
                heightValue = Int(height) ?? 0
                weightValue = Int(weight) ?? 0
            } else {
                validity = false
                resultText = "Error: Values must be an integer and greater than zero"
            }
        } else {
            validity = false
            resultText = "Error: Values must be an integer and greater than zero"
        }
        
    }
    
    mutating func calculateResult() {
        if validity == true {
            if heightText == "(inches)"{
                // Compute result for imperial
                result = weightValue / ( heightValue * heightValue) * 703
                resultText = "Your Calculated BMI: \(result)"
            } else if heightText == "(centimeters)" {
                // Compute result for metric
                result = (weightValue / heightValue / heightValue) * 10000
                resultText = "Your Calculated BMI: \(result)"
            } else {
                resultText = "Error"
            }
                
            
        }
    }
    
    mutating func setHeightImperial() -> String {
        heightText = "(inches)"
        return heightText
    }
    
    mutating func setHeightMetric() -> String {
        heightText = "(centimeters)"
        return heightText
    }
    
    mutating func setWeightImperial() -> String {
        weightText = "(pounds)"
        return weightText
    }
    
    mutating func setWeightMetric() -> String {
        weightText = "(kilograms)"
        return weightText
    }
    
    func getResultsText() -> String {
        return resultText
    }
    
    mutating func setMainText() -> String {
        mainPageText = "Instructions: Choose either metric or imperial units. Enter your weight and height. Choose calculate to get your calculated BMI."
        return mainPageText
    }
    
}
