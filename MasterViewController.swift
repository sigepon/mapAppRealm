//
//  MasterViewController.swift
//  masterDetailOrigin
//
//  Created by 菊池 重夫 on 2016/02/17.
//  Copyright © 2016年 sigepon. All rights reserved.
//

import UIKit
import RealmSwift

class MasterViewController: UITableViewController {
    
    let realm = try! Realm()
    let dataArray = try! Realm().objects(Model).sorted("id", ascending: false)
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = dataArray[indexPath.row]
        cell.textLabel?.text = object.name

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! DetailViewController
        
        if segue.identifier == "showDetail"{
            if let indexpath = self.tableView.indexPathForSelectedRow{
                
                let object = dataArray[indexpath.row]
                detailViewController.detailItem = object
            }
        }
    }
}
