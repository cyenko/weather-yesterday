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
        //Dynamically change the urlStr to user inputted zip code
        var urlStr = "http://api.openweathermap.org/data/2.5/weather?zip=60201,us&APPID="+weatherKey!
        log(urlStr)
        var url: NSURL = NSURL(string: urlStr)!
        var connection: NSURLConnection = NSURLConnection(request: NSURLRequest(URL:url),delegate:self,startImmediately:false)!
        connection.start()
        log("Started connection.")
        
        
    }
    
    //Connection delegate methods
    func connection(connection:NSURLConnection!,didReceiveData conData:NSData!){
        self.inData.appendData(conData)
    }
    func connectionDidFinishLoading(connection:NSURLConnection!){
        log("Connection terminated.")
        var result: NSDictionary = NSJSONSerialization.JSONObjectWithData(inData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        let json = JSON(data:inData)
        //Using SwiftyJSON b/c parsing JSON in native swift is a pain

        println(json["main"]["temp"])

        if let weatherKelvin = json["main"]["temp"].double{
            //If the value exists, grab it and update the label
            log("WEATHER: \(weatherKelvin)")
            lblTitle.text = "Today's Weather: \(weatherKelvin-273.15) Celsius"
        }
        else{
            lblTitle.text = "Weather not found!"
        }
        
    }
     func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        log("ERROR")
        println(error)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewDidAppear(animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        var alert = UIAlertController(title:"Test",message:"Hi Brittany!",preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title:"Click Me!",style:UIAlertActionStyle.Default,handler:nil))
        getWeather("60201")
        self.presentViewController(alert, animated: true, completion: nil)
        //Load weather for today and display in label
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

