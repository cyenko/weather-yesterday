//
//  ViewController.swift
//  Weather-Yesterday
//
//  Created by Christian Yenko on 4/11/15.
//
//

import UIKit
//URL Connection delegate to catch the JSON download complete action
class ViewController: UIViewController, NSURLConnectionDelegate{

    //Class variable connection data
    var inData : NSMutableData = NSMutableData()
    
    //GUI Elements
    @IBOutlet weak var lblTitle: UILabel!

    //Snippet from SO for standard logging function
    func log(logMessage: String, functionName: String = __FUNCTION__) {
        println("\(functionName): \(logMessage)")
    }
    //Function to pull and parse weather json
    func getWeather(zipcode: String){
        //Grab API Key from the plist file
        let keyPath = NSBundle.mainBundle().pathForResource("APIKeys", ofType: "plist")
        let configDict = NSDictionary(contentsOfFile: keyPath!)
        let weatherKey = configDict!.valueForKey("OpenWeatherAPI")?.valueForKey("APIKey") as? String
        
        log("GET weather for zip " + zipcode)
        //Dynamically change the urlStr to user input
        var urlStr = "http://headers.jsontest.com/"
        var url: NSURL = NSURL(string: urlStr)!
        var connection: NSURLConnection = NSURLConnection(request: NSURLRequest(URL:url),delegate:self,startImmediately:false)!
        connection.start()
        log("Started connection.")
        
        //Using SwiftyJSON b/c parsing JSON in native swift is a pain
        
    }
    
    //Connection delegate methods
    func connection(connection:NSURLConnection!,didReceiveData conData:NSData!){
        self.inData.appendData(conData)
    }
    func connectionDidFinishLoading(connection:NSURLConnection!){
        var result: NSDictionary = NSJSONSerialization.JSONObjectWithData(inData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewDidAppear(animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        var alert = UIAlertController(title:"Test",message:"Hi Brittany!",preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title:"Click Me!",style:UIAlertActionStyle.Default,handler:nil))
        log("About to calll")
        getWeather("60201")
        self.presentViewController(alert, animated: true, completion: nil)
        //Load weather for today and display in label
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

