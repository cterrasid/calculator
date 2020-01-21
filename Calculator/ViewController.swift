//
//  ViewController.swift
//  Calculator
//
//  Created by Clarette Terrasi on 20/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Creo una referencia de los enums: establezco el estado inicial de las cosas
    var currentOperation: Operator = .nothing
    var calcState: CalculationState = .enteringNum
    
    @IBOutlet weak var prooof: UITextView!
    //Almacenan los valores que introduzca en la calculadora
    var firstValue: String = ""
    var operation: [String] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            // este number es el segundo valor de la operación
            createOperation(number)
        } else if calcState == .enteringNum {
            resultLabel.text = "\(resultLabel.text!)\(number)"
            // aqui se crea el primer valor de la operación
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
        //Reset al acumulador de operaciones
        operation = []
        // Aqui sigue siendo el primer valor
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
//        print(firstValue + operation.joined())
        //        En esta fase, el firstValue es realmente el primer valor de la operación; incluso, es el resultado de la operacion que se convierte en el firstValue de otras operaciones
    }
    
}

