//
//  ViewController.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 12/2/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func signUpButton(sender: AnyObject) {
        
        var username = userName.text!
        var password = userPassword.text!
        //print(username)
        //print(password)
        
        // Udacity API
    
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       // request.HTTPBody = "{\"udacity\": {\"username\": \"account@domain.com\", \"password\": \"********\"}}".dataUsingEncoding(NSUTF8StringEncoding)
    
        request.HTTPBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".dataUsingEncoding(NSUTF8StringEncoding)
      
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if error != nil { // Handle error…
                return
            }
            let newData = data!.subdataWithRange(NSMakeRange(5, data!.length - 5)) /* subset response data! */
            print(NSString(data: newData, encoding: NSUTF8StringEncoding))
        }
        task.resume()

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

