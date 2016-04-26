//
//  HistoryViewController.swift
//  Calc
//
//  Created by studentuser on 4/25/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        history.contentSize = CGSizeMake(400, 2300)
        
        var number: CGFloat = 30
        for equation in equations {
            let label = UILabel(frame: CGRectMake(50, number, 300, 21))
            label.center = CGPointMake(150, number)
            label.textAlignment = NSTextAlignment.Left
            label.text = equation
            number = number + 30
            
            self.history.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "viewSegue") {
            let svc = segue.destinationViewController as! ViewController;
            
            svc.allEquations = equations
        }
    }
    
    var equations: [String]!
    
    @IBOutlet weak var history: UIScrollView!


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
