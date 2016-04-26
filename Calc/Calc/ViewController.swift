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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueTest") {
            let svc = segue.destinationViewController as! HistoryViewController;
            
            svc.toPass = equal.titleLabel!.text!
            
        }
    }
    
    ///////////////
    let inputs : Inputs = Inputs()

    @IBOutlet weak var resultTxt: UITextField!
    @IBOutlet weak var state_enter: UIButton!
    @IBOutlet weak var equal: UIButton!
    var calcMode = 0
    
    @IBAction func modeToggle(sender: AnyObject) {
        calcMode = sender.selectedSegmentIndex!
        
        state_enter.enabled = calcMode != 0
        equal.enabled = calcMode == 0
        
        inputs.clear()
        resultTxt.text = "0"
    }
    
    
    @IBAction func btn_nums(sender: UIButton) {
        let n = sender.titleLabel!.text!

        if inputs.checkPrevDbl() {
            resultTxt.text = resultTxt.text! + n
        } else {
            resultTxt.text = n;
        }
        
        inputs.presses.append(n);
        NSLog(String(inputs.nums))
    }
    
    @IBAction func btn_clear(sender: UIButton) {
        inputs.clear()
        resultTxt.text = ""
    }
    @IBAction func btn_ops(sender: UIButton) {
        let op = sender.titleLabel!.text!
        inputs.lastOp = op
        
        let n : Double? = Double(resultTxt.text!)
        inputs.nums.append(n!);
        inputs.presses.append(op);
        
        if calcMode == 1 && op != "Enter" && inputs.nums.count > 1 {
            calculate()
        }
    }
    
    func calculate() {
        var ans : Double?
        
        switch inputs.lastOp {
        case "+":
            ans = inputs.secondLastNum()! + inputs.lastNum()!;
        case "-":
            ans = inputs.secondLastNum()! - inputs.lastNum()!;
        case "x":
            ans = inputs.secondLastNum()! * inputs.lastNum()!;
        case "/":
            ans = inputs.secondLastNum()! / inputs.lastNum()!;
        case "%":
            ans = inputs.secondLastNum()! % inputs.lastNum()!;
        case "Count":
            ans = Double(inputs.nums.count)
        case "Avg":
            ans = inputs.sum() / Double(inputs.nums.count)
        case "Fact":
            inputs.nums.popLast()
            if inputs.nums.count > 1 {
                let alert = UIAlertController(title: "Unable to proceed", message: "Please clear inputs and input only one number for factorial operation.", preferredStyle:UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                ans = 0.0
            } else {
                ans = inputs.fact()
            }
        default:
            ans = inputs.lastNum();
        }
        
        resultTxt.text = String(ans!)
        inputs.clear()
    }
    
    @IBAction func btn_equal(sender: UIButton) {
        let n : Double? = Double(resultTxt.text!)
        inputs.nums.append(n!);
        
        calculate()
    }
    
    
}

