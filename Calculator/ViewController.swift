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
    var midAnswer = Int()
    
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
        
//        else if (isOperationTapped) {
//            if let number = sender.currentTitle {
//                secondNumber = String(number)
//                print(number)
//            }
//        }

    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        
        if (secondNumber != "") {
            if let operation = sender.currentTitle {
                operationTapped = String(operation)
                isTypingNumber = false
                isOperationTapped = true
                print(operation)
            }
        }

        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        print("firstNumber is: " + firstNumber)
        print("operationTapped is: " + operationTapped)
        print("secondNumber is: " + secondNumber)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
    }
    

}

