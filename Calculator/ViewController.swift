//
//  ViewController.swift
//  Calculator
//
//  Created by Clarette Terrasi on 20/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    var currentOperation: Operator = .nothing
    var calcState: CalculationState = .enteringNum
    
    @IBOutlet weak var prooof: UITextView!
    var firstValue: String = ""
    var operation: [String] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createOperation(_ element: String) {
        operation.append(element)
        operationLabel.text = operation.joined()
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        updateDisplay (number: String(sender.tag))
    }
    
    func updateDisplay (number: String) {
        if calcState == .newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = .enteringNum
            resultLabel.text = number
            createOperation(number)
        } else if calcState == .enteringNum {
            resultLabel.text = "\(resultLabel.text!)\(number)"
            createOperation(resultLabel.text!)
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        calcState = .newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        switch sender.tag {
        case 10:
            currentOperation = .add
            createOperation(" + ")
        case 11:
            currentOperation = .substract
            createOperation(" - ")
        case 12:
            currentOperation = .times
            createOperation(" * ")
        case 13:
            currentOperation = .divide
            createOperation(" / ")
        default:
            return
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculateSum()
        operation = []
    }
    
    func calculateSum () {
        if (firstValue.isEmpty) {
            return
        }
        
        var result = ""
        if currentOperation == .times {
            result = "\((Double(firstValue))! * Double(resultLabel.text!)!)"
        } else if currentOperation == .add {
            result = "\((Double(firstValue))! + Double(resultLabel.text!)!)"
        } else if currentOperation == .substract {
            result = "\((Double(firstValue))! - Double(resultLabel.text!)!)"
        } else if currentOperation == .divide {
            result = "\((Double(firstValue))! / Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = .newNumStarted
    }
    
}

