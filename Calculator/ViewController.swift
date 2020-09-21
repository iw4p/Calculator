//
//  ViewController.swift
//  Calculator
//
//  Created by Nima Akbarzade on 9/20/20.
//  Copyright © 2020 padidar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Variables
    
    var firstNumber = String()
    var secondNumber = String()
    var lastNumber = Int()
    var keyPressed = String()
    var isTypingNumber: Bool = false
    var operationTapped = String()
    var isOperationTapped : Bool = false
    var previousOperator = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Action Buttons

    @IBAction func NumberButtons(_ sender: UIButton) {
        
        if (!isTypingNumber) {
            if let number = sender.currentTitle {
                firstNumber = String(number)
                lastNumber = lastNumber * 10 + Int(firstNumber)!
                print(lastNumber)
            }
            resultLabel.text = String(lastNumber)
        }
        
        else if (isOperationTapped) {
            if let number = sender.currentTitle {
                secondNumber = String(number)
                lastNumber = lastNumber * 10 + Int(secondNumber)!
                print(lastNumber)
            }
            secondNumber = String(lastNumber)
            resultLabel.text = firstNumber + " " + operationTapped + " " + secondNumber
        }

    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        
        if (!isOperationTapped) {
            if let operation = sender.currentTitle {
                firstNumber = String(lastNumber)
                lastNumber = 0
                operationTapped = String(operation)
                isTypingNumber = true
                isOperationTapped = true
                print(operation)
                resultLabel.text = firstNumber + " " + operation
            }
        }

        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        print("firstNumber is: " + firstNumber)
        print("operationTapped is: " + operationTapped)
        print("secondNumber is: " + secondNumber)
                
        guard let first = Int(firstNumber) else {
            return
        }
        
        guard let second = Int(secondNumber) else {
            return
        }
        
        if operationTapped == "+" {
            resultLabel.text = String(first + second)
        }
        if operationTapped == "-" {
            resultLabel.text = String(first - second)
        }
        if operationTapped == "*" {
            resultLabel.text = String(first * second)
        }
        if operationTapped == "/" {
            resultLabel.text = String(first / second)
        }

    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        firstNumber = ""
        secondNumber = ""
        lastNumber = 0
        
        isTypingNumber = false
        isOperationTapped = false

        operationTapped = ""
        resultLabel.text = ""
    }
    

}

