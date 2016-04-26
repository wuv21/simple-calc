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
        
        history.contentSize = CGSizeMake(200, 2300)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var toPass:String!
    
    @IBOutlet weak var history: UIScrollView!
    
    @IBAction func test(sender: AnyObject) {
        NSLog(toPass);
        
        var number: CGFloat = 30
        
        for i in 1 ..< 100
        {
            let label = UILabel(frame: CGRectMake(0, number, 200, 21))
            label.center = CGPointMake(50, number)
            label.textAlignment = NSTextAlignment.Left
            label.text = "I'am a test label \(i)"
            self.view.addSubview(label)
            number = number + 30
            
            self.history.addSubview(label)
        }
        

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
