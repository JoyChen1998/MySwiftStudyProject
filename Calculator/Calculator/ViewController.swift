//
//  ViewController.swift
//  Calculator
//
//  Created by JoyChan on 2018/9/20.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var display: UILabel!
    
    var userTyping = false
    
    @IBAction func clickButton(_ sender: UIButton) {
        let resTitle = sender.currentTitle!
        print("\(resTitle) was called")
        if userTyping {
        let textDisplay = display.text!
        display.text = textDisplay + resTitle
        } else {
            display.text = resTitle
            userTyping = true
        }
    }

    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    private var brain: CalcBrain = CalcBrain()
    
    @IBAction func PerformOp(_ sender: UIButton) {
        if userTyping {
            brain.setOperand(displayValue)
            userTyping = false
        }
        
        if let mathSymbol = sender.currentTitle{
            brain.performOpration(mathSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
    }
}
