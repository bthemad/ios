//
//  ViewController.swift
//  Calculator
//
//  Created by Alexander Kudryashov on 19.04.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!

    var userIsTypingNumber = false
    var operandStack = Array<Double>()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }

        set {
            display.text = "\(newValue)"
            userIsTypingNumber = false
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTypingNumber = true
        }
    }

    @IBAction func enter() {
        userIsTypingNumber = false
        operandStack.append(displayValue)
        println("operandStack: \(operandStack)")
    }
}