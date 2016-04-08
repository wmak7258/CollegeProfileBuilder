//
//  SecondViewController.swift
//  CollegeProfileBuilder
//
//  Created by student1 on 2/25/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collegeName: UILabel!
    @IBOutlet weak var collegeLocation: UITextField!
    @IBOutlet weak var collegeStudents: UITextField!
    @IBOutlet weak var webAddress: UITextField!
    @IBOutlet weak var webButton: UIButton!
    
    var picker = UIImagePickerController()
    var passData = college()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.allowsEditing = true
        self.collegeLocation.delegate = self
        self.collegeStudents.delegate = self
        self.navigationItem.title = passData.name
        collegeName.text = passData.name
        collegeLocation.text = passData.location
        collegeStudents.text = passData.numberOfStudents
        image.image = passData.image
        webAddress.text = passData.web
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        passData.location = collegeLocation.text!
        passData.numberOfStudents = collegeStudents.text!
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "web"{
        let next = segue.destinationViewController as! WebViewController
            next.passData2 = passData }
        else if segue.identifier == "map" {
        let next2 = segue.destinationViewController as! MapViewController
            next2.passData3 = passData
        }
    }
    @IBAction func selectedImage(sender: UITapGestureRecognizer){
        let selectedPoint = sender.locationInView(self.view)
        if CGRectContainsPoint(image.frame, selectedPoint){
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.image.image = selectedImage
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true, completion: nil)
    }
}