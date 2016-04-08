//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by student1 on 2/24/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var collegeList: UITableView!
    var list: [college] = [college]()
    let princeton = UIImage(named: "princeton")
    let havard = UIImage(named: "havard")
    let yale = UIImage(named: "yale")
    
    override func viewWillAppear(animated: Bool) {
        collegeList.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let college1 = college(Name: "Princeton", Location: "Princeton, New Jersey", NumberOfStudents: "8,125", Image: princeton!, Web: "http://www.princeton.edu/main/")
        list.append(college1)
        let college2 = college(Name: "Havard College", Location: "Cambridge, Massachusetts", NumberOfStudents: "21,000", Image: havard!, Web: "http://www.harvard.edu/")
        list.append(college2)
        let college3 = college(Name: "Yale College", Location: "New Haven, Connecticut", NumberOfStudents: "12,336", Image: yale!, Web: "http://www.yale.edu/")
        list.append(college3)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentList = list[indexPath.row]
        currentCell.detailTextLabel?.text = currentList.location
        currentCell.textLabel?.text = currentList.name
        return currentCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondViewController = segue.destinationViewController as! SecondViewController
        let currentRow = collegeList.indexPathForSelectedRow?.row
        secondViewController.passData = list[currentRow!]
    }
    
    @IBAction func addButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Colleges", message: "Enter new items", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "enter name"
        })
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "enter location"
        })
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "enter number of students"
        })
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "enter web address"
        }
        let textField = alert.textFields![0] as UITextField
        let textField1 = alert.textFields![1] as UITextField
        let textField2 = alert.textFields![2] as UITextField
        let textField3 = alert.textFields![3] as UITextField
        let actionButton = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let newCollege = college(Name: textField.text!, Location: textField1.text!, NumberOfStudents: textField2.text!, Image: UIImage(), Web: textField3.text!)
            self.list.append(newCollege)
            self.collegeList.reloadData()
        })
        alert.addAction(actionButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            if let table = collegeList {
                list.removeAtIndex(indexPath.row)
                table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        }
    }
    
    @IBAction func editing(sender: UIBarButtonItem) {
        if collegeList.editing{
            collegeList.setEditing(false, animated: false);
            sender.title = "Edit"
            sender.style = UIBarButtonItemStyle.Plain;
        }
        else{
            collegeList.setEditing(true, animated: true);
            sender.title = "Done";
            sender.style =  UIBarButtonItemStyle.Done;
        }
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let move = list[sourceIndexPath.row]
        list.removeAtIndex(sourceIndexPath.row)
        list.insert(move, atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    
}

