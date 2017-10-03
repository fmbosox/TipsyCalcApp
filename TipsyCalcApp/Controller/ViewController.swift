//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Felipe Montoya on 10/1/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBOutlet weak var youPayLabel: UILabel!
    
    var tip = tipModel(billAmount: 0.0, tipPercent: 0.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
    }
    
    func setTipCalculationValues () {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func updateUI () {
        tipLabel.text = String (format: "$%0.2f", tip.tipAmount)
        totalLabel.text = String (format: "$%0.2f", tip.totalAmount)
        tipPercentageLabel.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
        splitLabel.text = "\(Int(splitStepper.value)) - Way Split"
        youPayLabel.text = String (format: "$%0.2f", tip.spliTotalAmount)
        
    }

    
    @IBAction func billAmountDidChange(_ sender: Any) {
        print("It changed")
        setTipCalculationValues()
        updateUI()
    }
    @IBAction func tipPercentageDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        print(tipPercentageSlider.value)
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func splitBillChanger(_ sender: UIStepper) {
        print(splitStepper.value)
        tip.totalBillPayers = splitStepper.value
        tip.calculateTip()
        updateUI()
    }
    
}

