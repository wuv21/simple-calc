//
//  ViewController.swift
//  Calc
//
//  Created by studentuser on 4/20/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///////////////
    let numInputs : InputtedNumbers = InputtedNumbers()
    let opInputs : InputtedOps = InputtedOps()

    @IBOutlet weak var resultTxt: UITextField!
    
    @IBAction func btn_nums(sender: UIButton) {
        let n = Int(sender.titleLabel!.text!)
        
        numInputs.nums.append(n!);
        NSLog(String(numInputs.nums))
    }
    
    @IBAction func btn_ops(sender: UIButton) {
        let op = sender.titleLabel!.text!
        
        opInputs.ops.append(op);
        NSLog(String(opInputs.ops))
    }
    
    @IBAction func btn_equal(sender: UIButton) {
        switch opInputs.lastOp()! {
        case "+":
            resultTxt.text = String(numInputs.lastNum()! + numInputs.secondLastNum()!);
        default:
            resultTxt.text = "N/A";
        }
    }
    
}

