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
    @IBOutlet weak var state_enter: UIButton!
    @IBOutlet weak var equal: UIButton!
    var calcMode = 0
    
    @IBAction func modeToggle(sender: AnyObject) {
        calcMode = sender.selectedSegmentIndex!
        
        state_enter.enabled = calcMode != 0
        equal.enabled = calcMode == 0
        
        numInputs.clear()
        opInputs.clear()
        resultTxt.text = "0"
    }
    
    
    @IBAction func btn_nums(sender: UIButton) {
        let n = Int(sender.titleLabel!.text!)
        
        numInputs.nums.append(n!);
        resultTxt.text = String(n!);
        NSLog(String(numInputs.nums))
    }
    
    @IBAction func btn_clear(sender: UIButton) {
        numInputs.clear()
        opInputs.clear()
        resultTxt.text = "0"
    }
    @IBAction func btn_ops(sender: UIButton) {
        let op = sender.titleLabel!.text!
        
        opInputs.ops.append(op);
        NSLog(String(opInputs.ops))
    }
    
    @IBAction func btn_equal(sender: UIButton) {
        var ans : Int?
        
        switch opInputs.lastOp() {
        case "+":
            ans = numInputs.secondLastNum()! + numInputs.lastNum()!;
        case "-":
            ans = numInputs.secondLastNum()! - numInputs.lastNum()!;
        case "x":
            ans = numInputs.secondLastNum()! * numInputs.lastNum()!;
        case "/":
            ans = numInputs.secondLastNum()! / numInputs.lastNum()!;
        case "%":
            ans = numInputs.secondLastNum()! % numInputs.lastNum()!;
        case "Count":
            ans = numInputs.nums.count
        case "Avg":
            ans = numInputs.sum() / numInputs.nums.count
        case "Fact":
            if numInputs.nums.count > 1 {
                let alert = UIAlertController(title: "Unable to proceed", message: "Please clear inputs and input only one number for factorial operation.", preferredStyle:UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                ans = 0
            } else {
                ans = numInputs.fact()
            }
        default:
            ans = numInputs.lastNum();
        }
        
        resultTxt.text = String(ans!)
        numInputs.clear()
        opInputs.clear()
        
    }
    
}

