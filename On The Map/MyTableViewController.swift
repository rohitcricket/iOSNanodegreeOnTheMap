//
//  MyTableViewController.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 1/7/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
    let friends = ["John", "Dagny", "Francisco"]



    @IBOutlet weak var myTableView: UITableView!

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        //let friend = friends[indexPath.row]
        let studentArray = (UIApplication.sharedApplication().delegate as! AppDelegate).studentArray
        let newStudentArr = studentArray?[indexPath.row]
        //cell.textLabel!.text = friend
        cell.textLabel!.text = newStudentArr?.firstName
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
}
