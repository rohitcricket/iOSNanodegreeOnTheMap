//
//  ViewController.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 12/2/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit

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
        // Login
        
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
        
        // Get Student Data
      
        let requestParse = NSMutableURLRequest(URL: NSURL(string: "https://api.parse.com/1/classes/StudentLocation")!)
        requestParse.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        requestParse.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
        let sessionParse = NSURLSession.sharedSession()
        
        let taskParse = sessionParse.dataTaskWithRequest(requestParse) { dataParse, responseParse, error in
            if error != nil { // Handle error...
                return
            }

            //print(NSString(data: dataParse!, encoding: NSUTF8StringEncoding))
            
            do {
                
                let json = try NSJSONSerialization.JSONObjectWithData(dataParse!, options: NSJSONReadingOptions.AllowFragments)
                
                if let dict = json as? Dictionary<String, AnyObject> {
                    
                    if let firstName = dict["firstName"] as? String, let lastName = dict["lastName"] as? String, let mediaUrl = dict["mediaUrl"] as? String, let latitude = dict["latitude"] as? String, let longitude = dict["longitute"] as? String {
                        
                        let student = Student(firstName: firstName, lastName: lastName, mediaUrl: mediaUrl, latitude: latitude, longitude: longitude)
                        
                        print(student.latitude)
                        //print(student.lastName)
                    }
                    //print("Did we get it? \(dict.debugDescription)")
                }
                
               //print(json)
                
            } catch {
                print("Could not serialize")
            }
     
        }
        taskParse.resume()

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

