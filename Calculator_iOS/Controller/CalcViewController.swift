//
//  ViewController.swift
//  Calculator_iOS
//
//  Created by Traton Gossink on 5/26/23.
//

import UIKit

class CalcViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var doneTyping: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display text to Integer.")
            }
            return number
            }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = Logic()
    
    @IBAction func funcBtnPressed(_ sender: UIButton) {
        
        doneTyping = true
        calculator.setNum(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if doneTyping {
                displayLabel.text = numValue
                doneTyping = false
            } else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

