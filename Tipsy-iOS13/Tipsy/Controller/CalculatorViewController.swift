//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    var selectedTip = 10.0
    var selectedSplit = 2.0
    var result = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            selectedTip = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            selectedTip = 10.0
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            selectedTip = 20.0
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let newValue = sender.value
        
        if newValue > selectedSplit {
            selectedSplit += 1
        } else {
            selectedSplit -= 1
        }
        
        
        splitNumberLabel.text = String(Int(selectedSplit))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField?.text ?? "0.0") ?? 0.0
        let tipPercent = selectedTip / 100
        let totalWithTip = bill + (bill * tipPercent)
        let perPerson = String(format: "%.2f",(totalWithTip / Double(selectedSplit)))
        
        result = Double(perPerson) ?? 0.0
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let vc = segue.destination as! ResultsViewController
            vc.totalPerPerson = result
        }
    }
    

}

