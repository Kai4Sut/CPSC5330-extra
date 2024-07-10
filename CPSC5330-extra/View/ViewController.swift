//
//  ViewController.swift
//  CPSC5330-extra
//
//  Created by user260677 on 7/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var metricButton: UIButton!
    @IBOutlet weak var imperialButton: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var bmilogic = BMILogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightLabel.text = bmilogic.setHeightMetric()
        weightLabel.text = bmilogic.setWeightMetric()
        instructionsLabel.text = bmilogic.setMainText()
    }

    
    @IBAction func selectMetric(_ sender: UIButton) {
        heightLabel.text = bmilogic.setHeightMetric()
        weightLabel.text = bmilogic.setWeightMetric()
    }
    
    @IBAction func selectImperial(_ sender: UIButton) {
        heightLabel.text = bmilogic.setHeightImperial()
        weightLabel.text = bmilogic.setWeightImperial()
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        instructionsLabel.text = bmilogic.setMainText()
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        
        bmilogic.validateInput(heightTextField.text!, weightTextField.text!)
        bmilogic.calculateResult()
        
        self.performSegue(withIdentifier: "toNavigate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toNavigate" {
            let navigation = segue.destination as! ResultsViewController
            navigation.resultsText = bmilogic.getResultsText()
        }
    }
    
    
}

