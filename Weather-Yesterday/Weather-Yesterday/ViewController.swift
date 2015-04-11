//
//  ViewController.swift
//  Weather-Yesterday
//
//  Created by Christian Yenko on 4/11/15.
//
//

import UIKit

class ViewController: UIViewController {
    //Snippet from SO for standard log
    @IBOutlet weak var lblTitle: UILabel!
    func log(logMessage: String, functionName: String = __FUNCTION__) {
        println("\(functionName): \(logMessage)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    override func viewDidAppear(animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        //Change
        var alert = UIAlertController(title:"Test",message:"Hi Brittany!",preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title:"Click Me!",style:UIAlertActionStyle.Default,handler:nil))
        log("About to calll")
        self.presentViewController(alert, animated: true, completion: nil)
        //Load weather for today and display in label
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

